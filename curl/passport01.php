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
<<<<<<< HEAD
<<<<<<< HEAD
curl_setopt_array($curl, [
=======
curl_setopt_array(
    $curl, [
>>>>>>> 1283aaa (first)
=======
curl_setopt_array(
    $curl, [
>>>>>>> dd31420 (first)
=======
curl_setopt_array($curl, [
>>>>>>> c219998 (first)
    CURLOPT_URL => $url_full,
    CURLOPT_RETURNTRANSFER => true,
    //CURLOPT_ENCODING => '',
    CURLOPT_MAXREDIRS => 10,
    CURLOPT_TIMEOUT => 30,
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
   // CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
=======
    // CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
>>>>>>> 1283aaa (first)
=======
    // CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
>>>>>>> dd31420 (first)
=======
   // CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
>>>>>>> c219998 (first)
    CURLOPT_CUSTOMREQUEST => 'GET',
    CURLOPT_VERBOSE => true,
    //CURLOPT_POST => true,
    CURLOPT_HTTPGET=>true,
    //CURLOPT_POSTFIELDS => $data,
    CURLOPT_HTTPHEADER => $headers,
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
]);
=======
    ]
);
>>>>>>> 1283aaa (first)
=======
    ]
);
>>>>>>> dd31420 (first)
=======
]);
>>>>>>> c219998 (first)

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
    echo 'cURL Error #:'.$err;
} else {
    echo $response;
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
}
=======
}
>>>>>>> 1283aaa (first)
=======
}
>>>>>>> dd31420 (first)
=======
}
>>>>>>> c219998 (first)
