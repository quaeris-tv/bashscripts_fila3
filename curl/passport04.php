<?php

declare(strict_types=1);

$curl = curl_init();

$domain = 'multi.local';
$client_id = '193CI2uGhLy2GMczwwfAFCd1jbmDW7UrInKtO5EB';

$headers = [
    'content-type: application/x-www-form-urlencoded',
];

$client_id=2;
$client_secret='T3xV9nzvpZkQbGl0VQrjVm8Lx3K5xne9Z4QQ4z8Y';

$email='marco.sottana@gmail.com';
$password='xxx';

$url='http://'.$domain.'/oauth/token';

$data = [
    //'grant_type' => 'authorization_code',
    'client_id' => $client_id,
    'client_secret' => $client_secret,
    //'username' => $email,
    //'password' => $password,
    //'scope' => '*',
];


/*
$data=[
    'grant_type'=>'authorization_code',
    'client_id'=>$client_id,
    'code_verifier'=>"yourGeneratedCodeVerifier",
    'code'=>"yourAuthorizationCode",
    'redirect_uri'=>"https://yourApp/callback"
];
*/
$data=http_build_query($data);


<<<<<<< HEAD
curl_setopt_array(
    $curl, [
=======
<<<<<<< HEAD
curl_setopt_array(
    $curl, [
=======
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
curl_setopt_array(
    $curl, [
=======
curl_setopt_array($curl, [
>>>>>>> a0985ac6 (up)
=======
curl_setopt_array($curl, [
>>>>>>> a0985ac6 (up)
=======
curl_setopt_array(
    $curl, [
>>>>>>> 15b740a3 (.)
>>>>>>> 5d5b6964 (.)
>>>>>>> 37b0029 (first)
    CURLOPT_URL => $url,
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_ENCODING => '',
    CURLOPT_MAXREDIRS => 10,
    CURLOPT_TIMEOUT => 30,
    CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
    CURLOPT_CUSTOMREQUEST => 'POST',
    CURLOPT_VERBOSE => true,
    CURLOPT_POST => true,
    CURLOPT_POSTFIELDS => $data,
    CURLOPT_HTTPHEADER => $headers,
<<<<<<< HEAD
    ]
);
=======
<<<<<<< HEAD
    ]
);
=======
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    ]
);
=======
]);
>>>>>>> a0985ac6 (up)
=======
]);
>>>>>>> a0985ac6 (up)
=======
    ]
);
>>>>>>> 15b740a3 (.)
>>>>>>> 5d5b6964 (.)
>>>>>>> 37b0029 (first)


$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
    echo 'cURL Error #:'.$err;
} else {
    echo $response;
}
