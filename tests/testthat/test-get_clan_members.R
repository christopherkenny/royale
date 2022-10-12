with_mock_dir("t/clan_members", {
  test_that("cr_get_clan_members works", {
    x <- cr_get_clan_members('99R2PQVR')
    expect_s3_class(x, 'tbl_df')
  })
})
