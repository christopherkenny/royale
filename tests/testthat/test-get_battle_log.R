with_mock_dir("t/battle_log", {
  test_that("cr_get_battle_log works", {
    x <- cr_get_battle_log('JYJQC88')
    expect_s3_class(x, 'tbl_df')
  })
})
