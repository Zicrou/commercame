require "application_system_test_case"

class ReparationsTest < ApplicationSystemTestCase
  setup do
    @reparation = reparations(:one)
  end

  test "visiting the index" do
    visit reparations_url
    assert_selector "h1", text: "Reparations"
  end

  test "should create reparation" do
    visit reparations_url
    click_on "New reparation"

    fill_in "Montant", with: @reparation.montant
    fill_in "Name", with: @reparation.name
    fill_in "Probleme", with: @reparation.probleme
    click_on "Create Reparation"

    assert_text "Reparation was successfully created"
    click_on "Back"
  end

  test "should update Reparation" do
    visit reparation_url(@reparation)
    click_on "Edit this reparation", match: :first

    fill_in "Montant", with: @reparation.montant
    fill_in "Name", with: @reparation.name
    fill_in "Probleme", with: @reparation.probleme
    click_on "Update Reparation"

    assert_text "Reparation was successfully updated"
    click_on "Back"
  end

  test "should destroy Reparation" do
    visit reparation_url(@reparation)
    click_on "Destroy this reparation", match: :first

    assert_text "Reparation was successfully destroyed"
  end
end
