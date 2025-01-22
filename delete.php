<?php
include 'config.php';

$id = $_GET['id'];
$sql = "DELETE FROM produk WHERE id_produk = $id";

if ($conn->query($sql) === TRUE) {
    echo "<!DOCTYPE html>
    <html>
    <head>
        <title>Hapus Produk</title>
        <link rel='stylesheet' href='style.css'>
    </head>
    <body>
        <h1>Produk berhasil dihapus!</h1>
        <a href='index.php'>Kembali ke Daftar Produk</a>
    </body>
    </html>";
} else {
    echo "<!DOCTYPE html>
    <html>
    <head>
        <title>Error</title>
        <link rel='stylesheet' href='style.css'>
    </head>
    <body>
        <h1>Error: {$conn->error}</h1>
        <a href='index.php'>Kembali ke Daftar Produk</a>
    </body>
    </html>";
}
?>
