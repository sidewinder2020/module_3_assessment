require 'rails_helper'

describe "Get /api/v1/items/:id" do
  it "returns an item" do
    item = Item.create!(name: "Babbadook", description: "a scary movie", image_url: "https://www.jqueryscript.net/images/Simplest-Responsive-jQuery-Image-Lightbox-Plugin-simple-lightbox.jpg")

    get "/api/v1/items/#{item.id}"

    response = JSON.parse(body)

    expect(response["id"]).to eq (1)
    expect(response["name"]).to eq("Babbadook")
    expect(response["description"]).to eq("a scary movie")
    expect(response["image_url"]).to eq("https://www.jqueryscript.net/images/Simplest-Responsive-jQuery-Image-Lightbox-Plugin-simple-lightbox.jpg")
  end
end

describe "Get /api/v1/items" do
  it "returns all items" do
    item = Item.create!(name: "Babbadook", description: "a scary movie", image_url: "https://www.jqueryscript.net/images/Simplest-Responsive-jQuery-Image-Lightbox-Plugin-simple-lightbox.jpg")
    item_2 = Item.create!(name: "Furry Costume", description: "costume for fun, furry conventions", image_url: "https://www.jqueryscript.net/images/Simplest-Responsive-jQuery-Image-Lightbox-Plugin-simple-lightbox.jpg")

    get "/api/v1/items"

    response = JSON.parse(body)

    expect(response.count).to eq 2
    expect(response[0]["id"]).to eq(1)
    expect(response[0]["name"]).to eq("Babbadook")
    expect(response[0]["description"]).to eq("a scary movie")
    expect(response[0]["image_url"]).to eq("https://www.jqueryscript.net/images/Simplest-Responsive-jQuery-Image-Lightbox-Plugin-simple-lightbox.jpg")
  end
end

describe "Post /api/v1/items" do
  it "creates an item" do
    post "/api/v1/items?item[name]=Crazy&item[description]=hell&item[image_url]=https://www.jqueryscript.net/images/Simplest-Responsive-jQuery-Image-Lightbox-Plugin-simple-lightbox.jpg"

    response = JSON.parse(body)

    expect(response["id"]).to eq(1)
    expect(response["name"]).to eq("Crazy")
    expect(response["description"]).to eq("hell")
    expect(response["image_url"]).to eq("https://www.jqueryscript.net/images/Simplest-Responsive-jQuery-Image-Lightbox-Plugin-simple-lightbox.jpg")
  end
end

describe "DELETE /api/v1/items/:id" do
  it "deletes an item" do
    item = Item.create!(name: "Babbadook", description: "a scary movie", image_url: "https://www.jqueryscript.net/images/Simplest-Responsive-jQuery-Image-Lightbox-Plugin-simple-lightbox.jpg")

    delete "/api/v1/items/#{item.id}"

    response = JSON.parse(body)

    expect(response["id"]).to eq(1)
    expect(response["name"]).to eq("Babbadook")
    expect(response["description"]).to eq("a scary movie")
    expect(response["image_url"]).to eq("https://www.jqueryscript.net/images/Simplest-Responsive-jQuery-Image-Lightbox-Plugin-simple-lightbox.jpg")
    expect(Item.count).to eq 0
  end
end
