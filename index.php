<?php include 'config.php'; ?>
<!DOCTYPE html>
<html>
<head>
    <title>Daftar Produk Elektro</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h1>Daftar Produk</h1>
    <a href="add.php">Tambah Produk</a>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Nama</th>
            <th>Kategori</th>
            <th>Harga</th>
            <th>Aksi</th>
        </tr>
        <?php
        $result = $conn->query("SELECT * FROM produk");
        while ($row = $result->fetch_assoc()) {
            echo "<tr>
                    <td>{$row['id_produk']}</td>
                    <td>{$row['nama']}</td>
                    <td>{$row['kategori']}</td>
                    <td>{$row['harga']}</td>
                    <td>
                        <a href='edit.php?id={$row['id_produk']}'>Edit</a> |
                        <a href='delete.php?id={$row['id_produk']}'>Hapus</a>
                    </td>
                </tr>";
        }
        ?>
    </table>
</body>
</html>
