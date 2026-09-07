<?php
require_once __DIR__ . '/db.php';

if (session_status() !== PHP_SESSION_ACTIVE) {
    session_start();
}

function app(): array { static $c; return $c ??= require __DIR__ . '/../config/app.php'; }
function e(string $v): string { return htmlspecialchars($v, ENT_QUOTES, 'UTF-8'); }
function csrf_token(): string { if (empty($_SESSION['csrf'])) $_SESSION['csrf'] = bin2hex(random_bytes(24)); return $_SESSION['csrf']; }
function csrf_check(): void { if (!isset($_POST['csrf']) || !hash_equals($_SESSION['csrf'] ?? '', (string)$_POST['csrf'])) { http_response_code(419); exit('Invalid CSRF token'); } }
function flash(string $type, string $message): void { $_SESSION['flash'] = [$type, $message]; }
function pull_flash(): ?array { $f = $_SESSION['flash'] ?? null; unset($_SESSION['flash']); return $f; }
function redirect(string $path): never { header('Location: ' . $path); exit; }
function current_user(): ?array { return $_SESSION['user'] ?? null; }
function require_login(): void { if (!current_user()) redirect('login.php'); }

function server_online(string $host, int $port): bool {
    $errno = 0; $errstr = '';
    $fp = @fsockopen($host, $port, $errno, $errstr, 0.35);
    if ($fp) { fclose($fp); return true; }
    return false;
}

function server_status(): array {
    $s = app()['server'];
    return [
        'login' => server_online($s['login_host'], $s['login_port']),
        'char'  => server_online($s['char_host'], $s['char_port']),
        'map'   => server_online($s['map_host'], $s['map_port']),
    ];
}

function account_exists(string $userid): bool {
    $st = db()->prepare('SELECT 1 FROM login WHERE userid = ? LIMIT 1');
    $st->execute([$userid]);
    return (bool)$st->fetchColumn();
}

function get_news(int $limit = 6): array {
    try {
        $st = db()->prepare('SELECT id, category, title, summary, created_at FROM web_news WHERE published = 1 ORDER BY created_at DESC LIMIT ?');
        $st->bindValue(1, $limit, PDO::PARAM_INT); $st->execute();
        return $st->fetchAll();
    } catch (Throwable $e) { return []; }
}
