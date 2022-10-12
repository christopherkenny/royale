with_mock_dir("t/challenges", {
  test_that("cr_get_challenges works", {
    x <- cr_get_challenges()
    expect_s3_class(x, 'tbl_df')
  })
})
