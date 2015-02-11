client.get("/gdc/md/")

client.post("/gdc/projects/", {a: 'b'})

client.delete("/gdc/projects/#{project_id}")

client.put("/gdc/projects/#{project_id}", {a: 'b'})