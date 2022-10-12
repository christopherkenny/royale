with_mock_dir("t/riverrace_log", {
  test_that("cr_get_riverrace_log works", {
    x <- cr_get_riverrace_log('99R2PQVR')
    expect_s3_class(x, 'tbl_df')
  })
})
