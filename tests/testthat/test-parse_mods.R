# test the parse_nodes function

library(Msstrings)

 data("MSfrags")

 test_that("Parse_mods works", {

  #test that a peptide with a single mod works\
  tmp <- parse_mods(MSfrags[1])

  expect_s3_class(tmp, 'protein_mods')
  expect_equal(tmp$mods[[1]], 'Glycosylation')
  expect_equal(tmp$mods_at[[1]],6)

  #test that a peptide with a two mods works
  tmp <- parse_mods(MSfrags[3])

  expect_equal(tmp$mods[[1]], c("Acetylation", "Deamidation"))
  expect_equal(tmp$mods_at[[1]],c(6, 31))

  #test that a peptide with no mods works
  tmp <- parse_mods(MSfrags[4])

  expect_length(tmp$mods[[1]], 0)
  expect_length(tmp$mods_at[[1]], 0)

})

