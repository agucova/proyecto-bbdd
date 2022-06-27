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
    <link rel="stylesheet" href="static/style.css">

    <!-- Add favicon (✈️) -->
    <link rel="icon" href="data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 viewBox=%220 0 100 100%22><text y=%22.9em%22 font-size=%2290%22>✈️</text></svg>">

</head>


<body>
    <?= $this->section('content') ?>
    <script src="static/script.js"></script>
    <!-- Cloudflare Web Analytics -->
    <script defer src='https://static.cloudflareinsights.com/beacon.min.js' data-cf-beacon='{"token": "3fe8f25934704e8490eee397a5b5a5f9"}'></script>
    <!-- End Cloudflare Web Analytics -->
    <script>
        // Scan for <time> tags and populate them with localized datetime strings
        document.querySelectorAll('time').forEach(function(time_element) {
            let datetime = new Date(time_element.getAttribute('datetime'));

            let timezone = datetime.getTimezoneOffset() / 60;
            if (timezone < 0) {
                timezone = '+' + timezone;
            } else {
                timezone = '-' + timezone;
            }

            time_element.innerHTML = "⏰ " + datetime.toLocaleString({
                hour12: false
            }) + " GMT" + timezone;
        });
    </script>

</body>

</html>