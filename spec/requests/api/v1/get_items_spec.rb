require 'rails_helper'

describe "Get /api/v1/destinations/:id" do
  it "returns a destination" do
    destination = Destination.create!(name: "Green Cove Springs", zip: "32043", description: "a place where dreams go to die", image_url: "https://placehold.it/300x300.png/000")

    get "/api/v1/destinations/#{destination.id}"

    response = JSON.parse(body)

    expect(response["id"]).to eq(1)
    expect(response["name"]).to eq("Green Cove Springs")
    expect(response["description"]).to eq("a place where dreams go to die")
    expect(response["zip"]).to eq("32043")
  end
end

describe "Get /api/v1/destinations" do
  it "returns all destinations" do
    destination = Destination.create!(name: "Green Cove Springs", zip: "32043", description: "a place where dreams go to die", image_url: "https://placehold.it/300x300.png/000")
    destination_2 = Destination.create!(name: "Orange Park", zip: "32073", description: "hellscape", image_url: "https://placehold.it/300x300.png/000")

    get "/api/v1/destinations"

    response = JSON.parse(body)

    expect(response.count).to eq 2
    expect(response[0]["id"]).to eq 1
    expect(response[0]["name"]).to eq("Green Cove Springs")
    expect(response[0]["description"]).to eq("a place where dreams go to die")
    expect(response[0]["zip"]).to eq("32043")
  end
end

describe "Post /api/v1/destinations" do
  it "creates a destination" do
    post "/api/v1/destinations?destination[name]=Hello&destination[zip]=33333&destination[description]=hell&destination[image_url]=https://placehold.it/300x300.png/000"

    response = JSON.parse(body)

    expect(response["id"]).to eq(1)
    expect(response["name"]).to eq("Hello")
    expect(response["description"]).to eq("hell")
    expect(response["zip"]).to eq("33333")
  end
end

describe "PUT /api/v1/destinations/:id" do
  it "updates a destination" do
    destination = Destination.create!(name: "Green Cove Springs", zip: "32043", description: "a place where dreams go to die", image_url: "https://placehold.it/300x300.png/000")

    put "/api/v1/destinations/#{destination.id}?destination[name]=Orange%20Park"

    response = JSON.parse(body)

    expect(response["id"]).to eq(1)
    expect(response["name"]).to eq("Orange Park")
    expect(response["description"]).to eq("a place where dreams go to die")
    expect(response["zip"]).to eq("32043")
  end
end

describe "DELETE /api/v1/destinations/:id" do
  it "deletes a destination" do
    destination = Destination.create!(name: "Green Cove Springs", zip: "32043", description: "a place where dreams go to die", image_url: "https://placehold.it/300x300.png/000")

    delete "/api/v1/destinations/#{destination.id}"

    response = JSON.parse(body)

    expect(response["id"]).to eq(1)
    expect(response["name"]).to eq("Green Cove Springs")
    expect(response["description"]).to eq("a place where dreams go to die")
    expect(response["zip"]).to eq("32043")
    expect(Destination.count).to eq 0
  end
end
