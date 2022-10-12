with_mock_dir("t/cards", {
  test_that("cr_get_cards works", {
    x <- cr_get_cards()
    expect_s3_class(x, 'tbl_df')
  })
})
