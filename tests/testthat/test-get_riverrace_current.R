with_mock_dir("t/riverrace_current", {
  test_that("cr_get_riverrace_current works", {
    x <- cr_get_riverrace_current('99R2PQVR')
    expect_s3_class(x, 'tbl_df')
  })
})
