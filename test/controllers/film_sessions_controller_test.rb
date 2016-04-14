require 'test_helper'

class FilmSessionsControllerTest < ActionController::TestCase
  setup do
    @film_session = film_sessions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:film_sessions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create film_session" do
    assert_difference('FilmSession.count') do
      post :create, film_session: { cinema_id: @film_session.cinema_id, number_of_session_place: @film_session.number_of_session_place, session_name: @film_session.session_name }
    end

    assert_redirected_to film_session_path(assigns(:film_session))
  end

  test "should show film_session" do
    get :show, id: @film_session
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @film_session
    assert_response :success
  end

  test "should update film_session" do
    patch :update, id: @film_session, film_session: { cinema_id: @film_session.cinema_id, number_of_session_place: @film_session.number_of_session_place, session_name: @film_session.session_name }
    assert_redirected_to film_session_path(assigns(:film_session))
  end

  test "should destroy film_session" do
    assert_difference('FilmSession.count', -1) do
      delete :destroy, id: @film_session
    end

    assert_redirected_to film_sessions_path
  end
end
