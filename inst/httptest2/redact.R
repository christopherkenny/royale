function(resp) {
  resp |>
    httptest2::gsub_response(pattern = royale::cr_get_key(), '')
}
