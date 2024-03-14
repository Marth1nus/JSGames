Set-Content .\index.html (
	(Get-Content .\index.html -Raw) -replace `
	('(\s*?)(<main id="project-links">)([\S\s]*?)(</main>)'), `
	('$1$2{0}$1$4' -f (
			Get-ChildItem *.html -Exclude index.html |
			ForEach-Object { $_.BaseName } |
			ForEach-Object { "`$1`t<a href=`"$_.html`">$_</a>" } |
			Join-String
		)
	)
).Trim()
