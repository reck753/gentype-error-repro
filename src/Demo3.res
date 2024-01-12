@genType
let updateJsonObjectKeyValue = (jsonObject, ~key: string, ~value) =>
  jsonObject
  ->JSON.Decode.object
  ->Option.map(s => {
    s->Dict.toArray->Array.concat([(key, value)])
  })
  ->Option.getOr([(key, value)])
  ->Dict.fromArray
  ->JSON.Encode.object
