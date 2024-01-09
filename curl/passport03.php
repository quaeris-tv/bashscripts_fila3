<?php

declare(strict_types=1);
error_reporting(E_ALL);
ini_set('display_errors', true);

$base_url = 'https://multi.local';
$login = '/api/user/login';
<<<<<<< HEAD
$addContact = '/api/quaeris/add-contact';
=======
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
$addContact = '/api/add-contact';
=======
$addContact = '/api/quaeris/add-contact';
>>>>>>> a176205 (first)
=======
$addContact = '/api/add-contact';
>>>>>>> f924de7 (Refactor API endpoint for adding contact)
=======
$addContact = '/api/add-contact';
>>>>>>> dev
=======
$addContact = '/api/quaeris/add-contact';
>>>>>>> a176205 (first)
=======
$addContact = '/api/add-contact';
>>>>>>> f924de7 (Refactor API endpoint for adding contact)
>>>>>>> c219998 (first)
$email = '';
$pass = '';

$ch = curl_init($base_url.$login);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

$post = ['email' => $email, 'password' => $pass];

curl_setopt($ch, CURLOPT_POSTFIELDS, $post);

$response = curl_exec($ch);
$json = json_decode($response);

<<<<<<< HEAD


=======
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======


>>>>>>> a176205 (first)
=======
>>>>>>> f924de7 (Refactor API endpoint for adding contact)
=======
>>>>>>> dev
=======


>>>>>>> a176205 (first)
=======
>>>>>>> f924de7 (Refactor API endpoint for adding contact)
>>>>>>> c219998 (first)
$headers = [
    // 'Content-Type: application/json',  //error
    'Authorization: Bearer '.$json->token,
];

<<<<<<< HEAD
curl_setopt_array(
    $ch, [
=======
curl_setopt_array($ch, [
>>>>>>> c219998 (first)
    CURLOPT_HTTPHEADER => $headers,
    CURLOPT_URL => $base_url.$addContact,
    CURLOPT_CUSTOMREQUEST => 'POST',
    CURLOPT_POST => true,
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_VERBOSE => true,
    CURLOPT_POSTFIELDS => $data,
<<<<<<< HEAD
    ]
);
=======
]);
>>>>>>> c219998 (first)

$response = curl_exec($ch);

echo '<pre>'.print_r($response, true).'</pre>';

curl_close($ch);

/*
 GET|HEAD        oauth/authorize passport.authorizations.authorize › Laravel\Passport › AuthorizationController@auth…
  POST            oauth/authorize passport.authorizations.approve › Laravel\Passport › ApproveAuthorizationController…
  DELETE          oauth/authorize . passport.authorizations.deny › Laravel\Passport › DenyAuthorizationController@deny
  GET|HEAD        oauth/clients ................. passport.clients.index › Laravel\Passport › ClientController@forUser
  POST            oauth/clients ................... passport.clients.store › Laravel\Passport › ClientController@store
  PUT             oauth/clients/{client_id} ..... passport.clients.update › Laravel\Passport › ClientController@update
  DELETE          oauth/clients/{client_id} ... passport.clients.destroy › Laravel\Passport › ClientController@destroy
  GET|HEAD        oauth/personal-access-tokens passport.personal.tokens.index › Laravel\Passport › PersonalAccessToke…
  POST            oauth/personal-access-tokens passport.personal.tokens.store › Laravel\Passport › PersonalAccessToke…
  DELETE          oauth/personal-access-tokens/{token_id} passport.personal.tokens.destroy › Laravel\Passport › Perso…
  GET|HEAD        oauth/scopes ........................ passport.scopes.index › Laravel\Passport › ScopeController@all
  POST            oauth/token ................... passport.token › Laravel\Passport › AccessTokenController@issueToken
  POST            oauth/token/refresh ... passport.token.refresh › Laravel\Passport › TransientTokenController@refresh
  GET|HEAD        oauth/tokens .... passport.tokens.index › Laravel\Passport › AuthorizedAccessTokenController@forUser
  DELETE          oauth/tokens/{token_id} passport.tokens.destroy › Laravel\Passport › AuthorizedAccessTokenControlle…
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
  */
=======
  */
>>>>>>> 1283aaa (first)
=======
  */
>>>>>>> dd31420 (first)
=======
  */
>>>>>>> c219998 (first)
