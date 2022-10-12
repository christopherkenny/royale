with_mock_dir("t/clan", {
  test_that("cr_get_clan works", {
    x <- cr_get_clan('99R2PQVR')
    expect_s3_class(x, 'tbl_df')
  })
})
