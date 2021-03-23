$PesterResult = Invoke-Pester -OutputFormat Detailed -PassThru
if ($PesterResult.Result -ne 'Passed') {
    throw "There were $($PesterResult.FailedCount) failed tests."
}
