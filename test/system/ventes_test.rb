require "application_system_test_case"

class VentesTest < ApplicationSystemTestCase
  setup do
    @vente = ventes(:one)
  end

  test "visiting the index" do
    visit ventes_url
    assert_selector "h1", text: "Ventes"
  end

  test "should create vente" do
    visit ventes_url
    click_on "New vente"

    fill_in "Price", with: @vente.price
    fill_in "Produit", with: @vente.produit_id
    fill_in "Quantity", with: @vente.quantity
    click_on "Create Vente"

    assert_text "Vente was successfully created"
    click_on "Back"
  end

  test "should update Vente" do
    visit vente_url(@vente)
    click_on "Edit this vente", match: :first

    fill_in "Price", with: @vente.price
    fill_in "Produit", with: @vente.produit_id
    fill_in "Quantity", with: @vente.quantity
    click_on "Update Vente"

    assert_text "Vente was successfully updated"
    click_on "Back"
  end

  test "should destroy Vente" do
    visit vente_url(@vente)
    click_on "Destroy this vente", match: :first

    assert_text "Vente was successfully destroyed"
  end
end
