require 'minitest/autorun'
require 'log_magic'

class DisMaxExplainerTest < Minitest::Test
  def setup
  end

  def test_matches_when_dis_max_present
    query = '{"query":{"dis_max":{"queries":[{"match":{"_all":{"query":"Play","boost":10,"operator":"and","analyzer":"searchkick_search"}}},{"match":{"_all":{"query":"Play","boost":10,"operator":"and","analyzer":"searchkick_search2"}}},{"match":{"_all":{"query":"Play","boost":1,"operator":"and","analyzer":"searchkick_search","fuzziness":1,"prefix_length":0,"max_expansions":3,"fuzzy_transpositions":true}}},{"match":{"_all":{"query":"Play","boost":1,"operator":"and","analyzer":"searchkick_search2","fuzziness":1,"prefix_length":0,"max_expansions":3,"fuzzy_transpositions":true}}}]}},"size":1000,"from":0,"timeout":"11s","_source":false}'
    assert ::LogMagic::SearchkickExplainer::DisMaxExplainerSection.new(query).matches?
  end

  def test_matches_not_when_dis_max_not_present
    query = '{"query":{"not_dis_max":{"queries":[{"match":{"_all":{"query":"Play","boost":10,"operator":"and","analyzer":"searchkick_search"}}},{"match":{"_all":{"query":"Play","boost":10,"operator":"and","analyzer":"searchkick_search2"}}},{"match":{"_all":{"query":"Play","boost":1,"operator":"and","analyzer":"searchkick_search","fuzziness":1,"prefix_length":0,"max_expansions":3,"fuzzy_transpositions":true}}},{"match":{"_all":{"query":"Play","boost":1,"operator":"and","analyzer":"searchkick_search2","fuzziness":1,"prefix_length":0,"max_expansions":3,"fuzzy_transpositions":true}}}]}},"size":1000,"from":0,"timeout":"11s","_source":false}'
    refute ::LogMagic::SearchkickExplainer::DisMaxExplainerSection.new(query).matches?
  end
end
