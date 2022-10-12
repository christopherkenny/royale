function(resp) {
  resp |>
    httptest2::gsub_response('https://api.clashroyale.com/v1/', '', fixed = TRUE) |>
    httptest2::gsub_response(pattern = royale::cr_get_key(), '')
}
