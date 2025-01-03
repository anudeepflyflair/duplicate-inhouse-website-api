resource "aws_lambda_function" "accessibilityRequest_Website_Dev" {
  filename                           = "./lambda_function_files/accessibilityRequest_Website_Dev.zip"
  source_code_hash                   = filebase64sha256("./lambda_function_files/accessibilityRequest_Website_Dev.zip")
  function_name                      = "accessibilityRequest_Website_Dev-AD"
  handler                            = "lambda_function.lambda_handler"
  role                               = aws_iam_role.jwt_token_role.arn
  runtime                            = "python3.12"
  timeout                            = 10

  layers = [
     aws_lambda_layer_version.lambda_layer.arn
    ]
}

resource "aws_lambda_function" "ancillarySearch" {
  filename                           = "./lambda_function_files/ancillarySearch.zip"
  source_code_hash                   = filebase64sha256("./lambda_function_files/ancillarySearch.zip")
  function_name                      = "ancillarySearch-AD"
  handler                            = "lambda_function.lambda_handler"
  role                               = aws_iam_role.jwt_token_role.arn
  runtime                            = "python3.11"
  timeout                            = 80

  layers = [
     aws_lambda_layer_version.lambda_layer.arn
    ]
}

resource "aws_lambda_function" "baggage" {
  filename                           = "./lambda_function_files/baggage.zip"
  source_code_hash                   = filebase64sha256("./lambda_function_files/baggage.zip")
  function_name                      = "baggage-AD"
  handler                            = "lambda_function.lambda_handler"
  role                               = "arn:aws:iam::888577036740:role/service-role/baggage-role-vhect9mj"
  runtime                            = "python3.11"
  timeout                            = 63

  layers = [
     aws_lambda_layer_version.lambda_layer.arn
    ]
}


resource "aws_lambda_function" "createReservation_Web_Dev" {
  filename                           = "./lambda_function_files/createReservation_Web_Dev.zip"
  source_code_hash                   = filebase64sha256("./lambda_function_files/createReservation_Web_Dev.zip")
  function_name                      = "createReservation_Web_Dev-AD"
  handler                            = "lambda_function.lambda_handler"
  role                               = aws_iam_role.jwt_token_role.arn
  runtime                            = "python3.12"
  timeout                            = 300

  layers = [
     aws_lambda_layer_version.lambda_layer.arn
    ]
}

resource "aws_lambda_function" "flightSearch" {
  filename                           = "./lambda_function_files/flightSearch.zip"
  source_code_hash                   = filebase64sha256("./lambda_function_files/flightSearch.zip")
  function_name                      = "flightSearch-AD"
  handler                            = "lambda_function.lambda_handler"
  role                               = aws_iam_role.jwt_token_role.arn
  runtime                            = "python3.11"
  timeout                            = 8
  
  layers = [
     aws_lambda_layer_version.lambda_layer.arn
    ]
}

resource "aws_lambda_function" "flightSelection_dev_Web" {
  filename                           = "./lambda_function_files/flightSelection_dev_Web.zip"
  source_code_hash                   = filebase64sha256("./lambda_function_files/flightSelection_dev_Web.zip")
  function_name                      = "flightSelection_dev_Web-AD"
  handler                            = "lambda_function.lambda_handler"
  role                               = aws_iam_role.jwt_token_role.arn
  runtime                            = "python3.11"
  timeout                            = 3

  layers = [
     aws_lambda_layer_version.lambda_layer.arn
    ]
}

resource "aws_lambda_function" "lowFareoptions_Dev_Website" {
  filename                           = "./lambda_function_files/lowFareoptions_Dev_Website.zip"
  source_code_hash                   = filebase64sha256("./lambda_function_files/lowFareoptions_Dev_Website.zip")
  function_name                      = "lowFareoptions_Dev_Website-AD"
  handler                            = "lambda_function.lambda_handler"
  role                               = aws_iam_role.jwt_token_role.arn
  runtime                            = "python3.11"
  timeout                            = 3

  layers = [
     aws_lambda_layer_version.lambda_layer.arn
    ]
}

resource "aws_lambda_function" "paymenthMethods" {
  filename                           = "./lambda_function_files/paymenthMethods.zip"
  source_code_hash                   = filebase64sha256("./lambda_function_files/paymenthMethods.zip")
  function_name                      = "paymenthMethods-AD"
  handler                            = "lambda_function.lambda_handler"
  role                               = aws_iam_role.jwt_token_role.arn
  runtime                            = "python3.12"
  timeout                            = 15

  layers = [
     aws_lambda_layer_version.lambda_layer.arn
    ]
}


resource "aws_lambda_function" "reservationPaymentTransaction_dev_IHW" {
  filename                           = "./lambda_function_files/reservationPaymentTransaction_dev_IHW.zip"
  source_code_hash                   = filebase64sha256("./lambda_function_files/reservationPaymentTransaction_dev_IHW.zip")
  function_name                      = "reservationPaymentTransaction_dev_IHW-AD"
  handler                            = "lambda_function.lambda_handler"
  role                               = aws_iam_role.jwt_token_role.arn
  runtime                            = "python3.12"
  tags = {
    Lamda = "IHW-dev"
  }
  tags_all = {
    Lamda = "IHW-dev"
  }
  timeout = 150

  layers = [
     aws_lambda_layer_version.lambda_layer.arn
    ]
}

resource "aws_lambda_function" "seatSealection" {
  filename                           = "./lambda_function_files/seatSealection.zip"
  source_code_hash                   = filebase64sha256("./lambda_function_files/seatSealection.zip")
  function_name                      = "seatSealection-AD"
  handler                            = "lambda_function.lambda_handler"
  role                               = "arn:aws:iam::888577036740:role/service-role/seatSealection-role-hwgr84zk"
  runtime                            = "python3.11"
  timeout                            = 63

 layers = [
     aws_lambda_layer_version.lambda_layer.arn
    ]
}

resource "aws_lambda_function" "voucherCode" {
  filename                           = "./lambda_function_files/voucherCode.zip"
  source_code_hash                   = filebase64sha256("./lambda_function_files/voucherCode.zip")
  function_name                      = "voucherCode-AD"
  handler                            = "lambda_function.lambda_handler"
  role                               = aws_iam_role.jwt_token_role.arn
  runtime                            = "python3.12"
  timeout                            = 3
  environment {
    variables = {
      API_URL     = "https://flairair-api.intelisystraining.ca/RESTv1/vouchers/Generate?{fields}  "
      PASSWORD    = "APIGATE"
      USERNAME    = "Flair123$"
      VOUCHER_KEY = "aƒJj2ImKybdP8tQcem2rUqODpzveNdvDKwoL3l¥DYg8="
    }
  }

  layers = [
     aws_lambda_layer_version.lambda_layer.arn
    ]
}


resource "aws_lambda_function" "Website_Dev_LamdaAuthoriser" {
  filename                           = "./lambda_function_files/Website_Dev_LamdaAuthoriser.zip"
  source_code_hash                   = filebase64sha256("./lambda_function_files/Website_Dev_LamdaAuthoriser.zip")
  function_name                      = "Website_Dev_LamdaAuthoriser-AD"
  handler                            = "lambda_function.lambda_handler"
  role                               = aws_iam_role.jwt_token_role.arn
  runtime                            = "python3.11"
  timeout                            = 10

  layers = [
     aws_lambda_layer_version.lambda_layer.arn
    ]
}