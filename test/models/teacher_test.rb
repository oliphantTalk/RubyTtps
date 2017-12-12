require 'test_helper'

class TeacherTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'Docente Valido' do
    t = Teacher.new(name: 'Teo', surname: 'Barrena', email: 'teobarrena@gmail.com', password: 'teopepateo', username:'teoatun')
    assert t.valid?, 'Perfecto'
  end

  test 'Docente Invalido sin nombre' do
    t = Teacher.new(surname: 'Barrena', email: 'teobarrena@gmail.com', password: 'teopepateo', username:'teoatun')
    refute t.valid?, 'user is valid without a name'
    assert_not_nil t.errors[:name], 'no validation error for name present'
  end

  test 'Docente Invalido sin mail' do
    t = Teacher.new(surname: 'Barrena',  password: 'teopepateo', username:'teoatun')
    refute t.valid?, 'user is valid without a name'
    assert_not_nil t.errors[:mail], 'no validation error for name present'
  end
end
