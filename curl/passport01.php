<?php

declare(strict_types=1);

$curl = curl_init();

$domain = 'multi.local';
$client_id = '193CI2uGhLy2GMczwwfAFCd1jbmDW7UrInKtO5EB';

$headers = [
    //'content-type: application/x-www-form-urlencoded',
];


/*
https://casavio-stg.das24.it/oauth/authorize?
client_id=9956c4b0-4032-48e5-9031-0a39b233490b
&redirect_uri=com.egeatech.camping24%3A%2F%2Floginsuccess
&scope=core%20technicians
&response_type=code
&state=mcB9WRJaSpDXVLfYyV3O9ZEK095NnbjJk3_Qc08lc9AHKuafZNsTSg
&code_challenge=l39roTPyDib4iFdYFIB5ca6BKD-A7HyMJ4JFHutzHPg
&code_challenge_method=S256
*/

$data = [
    'client_id'=> '9956c4b0-4032-48e5-9031-0a39b233490b',
    'redirect_uri'=> 'com.egeatech.camping24', //://loginsuccess
    
    'scope'=>'core technicians',
    'response_type'=>'code',
    'state'=> 'mcB9WRJaSpDXVLfYyV3O9ZEK095NnbjJk3_Qc08lc9AHKuafZNsTSg',
    'code_challenge'=> 'l39roTPyDib4iFdYFIB5ca6BKD-A7HyMJ4JFHutzHPg',
    'code_challenge_method'=> 'S256',
];

$data=http_build_query($data);

$domain='casavio-stg.das24.it';
//$domain='multi.local';

$url='https://'.$domain.'/oauth/authorize';

//die($url.'?'.$data);

$url_full='https://casavio-stg.das24.it/oauth/authorize?client_id=9956c4b0-4032-48e5-9031-0a39b233490b&redirect_uri=com.egeatech.camping24%3A%2F%2Floginsuccess&scope=core%20technicians&response_type=code&state=mcB9WRJaSpDXVLfYyV3O9ZEK095NnbjJk3_Qc08lc9AHKuafZNsTSg&code_challenge=l39roTPyDib4iFdYFIB5ca6BKD-A7HyMJ4JFHutzHPg&code_challenge_method=S256';


$url_full1=$url.'?'.$data;


echo $url_full.'<br/><br/><br/><br/><br/>'.$url_full1.'<br/><br/><br/>';
die('aa');


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
    CURLOPT_URL => $url_full,
    CURLOPT_RETURNTRANSFER => true,
    //CURLOPT_ENCODING => '',
    CURLOPT_MAXREDIRS => 10,
    CURLOPT_TIMEOUT => 30,
<<<<<<< HEAD
    // CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
=======
<<<<<<< HEAD
    // CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
=======
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    // CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
=======
   // CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
>>>>>>> a0985ac6 (up)
=======
   // CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
>>>>>>> a0985ac6 (up)
=======
    // CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
>>>>>>> 15b740a3 (.)
>>>>>>> 5d5b6964 (.)
>>>>>>> 37b0029 (first)
    CURLOPT_CUSTOMREQUEST => 'GET',
    CURLOPT_VERBOSE => true,
    //CURLOPT_POST => true,
    CURLOPT_HTTPGET=>true,
    //CURLOPT_POSTFIELDS => $data,
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
