module OmniauthMacros
  def mock_auth_hash
    # The mock_auth configuration allows you to set per-provider (or default)
    # authentication hashes to return during integration testing.
    OmniAuth::AuthHash.new

    OmniAuth.config.mock_auth[:google_oauth2] = {
      "provider"=>"google_oauth2",
      "uid"=>"108050155182864044820",
      "info"=>
       {
        "name"=>"Zach Trokey",
        "email"=>"ztrokey@gmail.com",
        "unverified_email"=>"ztrokey@gmail.com",
        "email_verified"=>true,
        "first_name"=>"Zach",
        "last_name"=>"Trokey",
        "image"=>"https://lh3.googleusercontent.com/a/AATXAJwm3KoLO2OTxvsXETbM7__wSjywrwci-yhfk6Bq=s96-c"
      },
      "credentials"=>
       {
        "token"=>"ya29.a0ARrdaM_hwMUgPQkVtzvjc61AsVHdYS-fTnTLQFr93X4ilxq8rDUxrandWBgsmM2959tKybeTh5yO0q8Z_zj0adNYi0t-kj70XHYdIELGp3-yMV6OGrDn06V1nwfjCga829CDHiq4zrWM64J_MScxC07JvQdsGA",
        "expires_at"=>1627765853,
        "expires"=>true
      },
      "extra"=>
       {
        "id_token"=>
         "eyJhbGciOiJSUzI1NiIsImtpZCI6IjNkZjBhODMxZTA5M2ZhZTFlMjRkNzdkNDc4MzQ0MDVmOTVkMTdiNTQiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2FjY291bnRzLmdvb2dsZS5jb20iLCJhenAiOiIzNTg1NTEwNTcxMS1sb21lNm5jNzYwZGhpbTAyaGk2dGNnZTBicXBmMW04NS5hcHBzLmdvb2dsZXVzZXJjb250ZW50LmNvbSIsImF1ZCI6IjM1ODU1MTA1NzExLWxvbWU2bmM3NjBkaGltMDJoaTZ0Y2dlMGJxcGYxbTg1LmFwcHMuZ29vZ2xldXNlcmNvbnRlbnQuY29tIiwic3ViIjoiMTA4MDUwMTU1MTgyODY0MDQ0ODIwIiwiZW1haWwiOiJ6dHJva2V5QGdtYWlsLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJhdF9oYXNoIjoiVkZOTk1DU2UwVHNCSWhyM3JHR3BwUSIsIm5hbWUiOiJaYWNoIFRyb2tleSIsInBpY3R1cmUiOiJodHRwczovL2xoMy5nb29nbGV1c2VyY29udGVudC5jb20vYS9BQVRYQUp3bTNLb0xPMk9UeHZzWEVUYk03X193U2p5d3J3Y2kteWhmazZCcT1zOTYtYyIsImdpdmVuX25hbWUiOiJaYWNoIiwiZmFtaWx5X25hbWUiOiJUcm9rZXkiLCJsb2NhbGUiOiJlbiIsImlhdCI6MTYyNzc2MjI1NCwiZXhwIjoxNjI3NzY1ODU0fQ.BmvX2OAT__0Opr_CSkmNtYYWcHiIJ4BAutw2BB5jMxeCQAMCGepN0aAubYz0A_vnFSZmdt1OMbZ5OK2LH2gnG4-nMmYEDlt3urtv1mgrXRenerdzVGz3eeirXBUeXgvzbXMps6ySVwLUT_MvznID0LM5QVYvYLTihKt1TfszRfMDuJTIP16PKax_IdmZ_ub5bFTQCwHvj20bq_9_4Ectc9nVKzQRMeMv9PUvUltH0dZJmjyiweq7qNYSCu60wEBilUIymnXhtIG-gVGD6Gw4QBj4zaP8bYib6ktbwHwhhFch0d_oH5NprD2NsUzlQYp2tn1OJy6OTKRrKB8ACR9_Pg",
         "id_info"=>
         {
          "iss"=>"https://accounts.google.com",
          "azp"=>"35855105711-lome6nc760dhim02hi6tcge0bqpf1m85.apps.googleusercontent.com",
          "aud"=>"35855105711-lome6nc760dhim02hi6tcge0bqpf1m85.apps.googleusercontent.com",
          "sub"=>"108050155182864044820",
          "email"=>"ztrokey@gmail.com",
          "email_verified"=>true,
          "at_hash"=>"VFNNMCSe0TsBIhr3rGGppQ",
          "name"=>"Zach Trokey",
          "picture"=>"https://lh3.googleusercontent.com/a/AATXAJwm3KoLO2OTxvsXETbM7__wSjywrwci-yhfk6Bq=s96-c",
          "given_name"=>"Zach",
          "family_name"=>"Trokey",
          "locale"=>"en",
          "iat"=>1627762254,
          "exp"=>1627765854
        },
        "raw_info"=>
         {
          "sub"=>"108050155182864044820",
          "name"=>"Zach Trokey",
          "given_name"=>"Zach",
          "family_name"=>"Trokey",
          "picture"=>"https://lh3.googleusercontent.com/a/AATXAJwm3KoLO2OTxvsXETbM7__wSjywrwci-yhfk6Bq=s96-c",
          "email"=>"ztrokey@gmail.com",
          "email_verified"=>true,
          "locale"=>"en"
        }
      }
    }
  end
end
