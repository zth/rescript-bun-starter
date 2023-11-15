let writeInHtml = content => {
  `<!DOCTYPE html>
<html>
    <head></head>
    <body>
        ${content}
    </body>
</html>`
}

let server = Bun.serve({
  port: 7777,
  fetch: async (request, _server) => {
    let url = request->Request.url->URL.make

    let options: Response.responseInit = {
      headers: FromArray([("Content-Type", "text/html")]),
    }

    switch url->URL.pathname {
    | "/add" =>
      let getIntFromQueryParam = name =>
        url
        ->URL.searchParams
        ->URLSearchParams.get(name)
        ->Option.flatMap(v => Int.fromString(v))
        ->Option.getWithDefault(0)

      let a = getIntFromQueryParam("a")
      let b = getIntFromQueryParam("b")

      let result = Utils.add(a, b)->Int.toString
      let html = writeInHtml(`<h1>Result</h1><div>The result of the addition is: ${result}</div>`)

      Response.make(html, ~options)
    | "/" => Response.make(writeInHtml("<h1>Welcome!</h1>"), ~options)
    | _ =>
      Response.make(
        "<h1>404</h1>",
        ~options={
          ...options,
          status: 404,
        },
      )
    }
  },
})

let serverUrl = server->Bun.Server.hostname ++ ":" ++ server->Bun.Server.port->Int.toString

Console.log(`Listening on ${serverUrl}`)
