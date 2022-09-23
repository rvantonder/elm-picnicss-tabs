all:
	npx elm-live src/Main.elm --port=9000 --start-page=index.html -- --output=public/dist/main.js

clean:
	@rm -r elm-stuff	

.PHONY: all
