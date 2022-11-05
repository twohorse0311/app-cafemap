# frozen_string_literal: true

require_relative 'place_api_spec_helper'

describe 'Tests Place API library' do
  before do
    VcrHelper.configure_vcr_for_palce
  end

  after do
    VcrHelper.eject_vcr
  end

  describe 'Store information' do
    before do
      @store = CafeMap::CafeNomad::InfoMapper.new(TOKEN_NAME, TEST_STORE).load_several
      @yaml_keys = STORE_CORRECT[0..].map { |key| PLACE_CORRECT[key]['results'] }
    end

    it 'HAPPY: should provide correct Store attributes' do
      _(@store.map { |item| item }[0].place_id.must_equal(@yaml_keys.map do |item|
                                                            item.map do |i|
                                                              i['place_id']
                                                            end
                                                          end[0][0]))
    end

    it 'HAPPY: should provide correct Store attributes' do
      _(@store.map { |item| item }[0].rating.must_equal(@yaml_keys.map do |item|
                                                          item.map do |i|
                                                            i['rating']
                                                          end
                                                        end[0][0]))
    end

    it 'BAD: should raise exception on incorrect invalid result' do
      bad = CafeMap::Place::StoreMapper.new(TOKEN_NAME, FAKE_TEST_STORE).bad_request
      _(bad).must_equal INCORRECT['INVALID_REQUEST']['status']
    end
  end
end