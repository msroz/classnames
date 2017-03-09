require "spec_helper"

describe Classnames do
  test_cases = [
    { args: 1,   expected: '1' },
    { args: [1,2], expected: '1 2' },
    { args: "hoge", expected: 'hoge' },
    { args: ["hoge", "fuga", "piyo"], expected: 'hoge fuga piyo' },
    { args: { hoge: true, fuga: true }, expected: 'hoge fuga' },
    { args: { hoge: false, fuga: true }, expected: 'fuga' },
    { args: [ 1,2,3,4,[5,6, { seven: true, eight: false }]], expected: '1 2 3 4 5 6 seven' },
    { args: [false, nil, ""], expected: '' },
    { args: [ "first", { second: { hoge: "fuga" } }, "third"], expected: 'first second third' },
  ]

  test_cases.each do |test_case|
    it 'should return valid string' do
      expect(classnames(test_case[:args])).to eq(test_case[:expected])
    end
  end
end
