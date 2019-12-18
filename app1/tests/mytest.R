app <- ShinyDriver$new("../")
app$snapshotInit("mytest")

app$snapshot()
app$setInputs(siderbarmenu = "cards")
app$snapshot()
app$setInputs(siderbarmenu = "tables")
app$snapshot()
