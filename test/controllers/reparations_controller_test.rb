require "test_helper"

class ReparationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reparation = reparations(:one)
  end

  test "should get index" do
    get reparations_url
    assert_response :success
  end

  test "should get new" do
    get new_reparation_url
    assert_response :success
  end

  test "should create reparation" do
    assert_difference("Reparation.count") do
      post reparations_url, params: { reparation: { montant: @reparation.montant, name: @reparation.name, probleme: @reparation.probleme } }
    end

    assert_redirected_to reparation_url(Reparation.last)
  end

  test "should show reparation" do
    get reparation_url(@reparation)
    assert_response :success
  end

  test "should get edit" do
    get edit_reparation_url(@reparation)
    assert_response :success
  end

  test "should update reparation" do
    patch reparation_url(@reparation), params: { reparation: { montant: @reparation.montant, name: @reparation.name, probleme: @reparation.probleme } }
    assert_redirected_to reparation_url(@reparation)
  end

  test "should destroy reparation" do
    assert_difference("Reparation.count", -1) do
      delete reparation_url(@reparation)
    end

    assert_redirected_to reparations_url
  end
end
