<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title><?= $this->e($title) ?></title>
    <!-- Meta tags -->
    <meta name="description" content="<?= $this->e($description) ?>" />

    <!-- Water.css -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/water.css@2/out/dark.css">

    <!-- Add style -->
    <link rel="stylesheet" href="/~grupo27/static/style.css">

</head>

<body>
    <?= $this->section('content') ?>
    <script src="static/script.js"></script>
    <!-- Cloudflare Web Analytics -->
    <script defer src='https://static.cloudflareinsights.com/beacon.min.js' data-cf-beacon='{"token": "3fe8f25934704e8490eee397a5b5a5f9"}'></script><!-- End Cloudflare Web Analytics -->
</body>

</html>
