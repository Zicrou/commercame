require "application_system_test_case"

class ProduitsTest < ApplicationSystemTestCase
  setup do
    @produit = produits(:one)
  end

  test "visiting the index" do
    visit produits_url
    assert_selector "h1", text: "Produits"
  end

  test "should create produit" do
    visit produits_url
    click_on "New produit"

    fill_in "Image", with: @produit.image
    fill_in "Name", with: @produit.name
    fill_in "Price", with: @produit.price
    fill_in "Quantity", with: @produit.quantity
    click_on "Create Produit"

    assert_text "Produit was successfully created"
    click_on "Back"
  end

  test "should update Produit" do
    visit produit_url(@produit)
    click_on "Edit this produit", match: :first

    fill_in "Image", with: @produit.image
    fill_in "Name", with: @produit.name
    fill_in "Price", with: @produit.price
    fill_in "Quantity", with: @produit.quantity
    click_on "Update Produit"

    assert_text "Produit was successfully updated"
    click_on "Back"
  end

  test "should destroy Produit" do
    visit produit_url(@produit)
    click_on "Destroy this produit", match: :first

    assert_text "Produit was successfully destroyed"
  end
end
