require 'test_helper'

class AllTeachersAndTheirStudentsTest < ActionDispatch::IntegrationTest
  test "user can view all teachers and their students" do
    teacher1 = Teacher.create(first_name: "Mike", last_name: "Dao" )
    teacher2 = Teacher.create(first_name: "Andrew", last_name: "Carmer" )

    student1 = teacher1.students.create(first_name: "Kris", last_name: "Foss", age: 32 )
    student2 = teacher1.students.create(first_name: "Ilana", last_name: "Dao", age: 28 )
    student2 = teacher1.students.create(first_name: "Ling", last_name: "Dao", age: 26 )
    student3 = teacher2.students.create(first_name: "Ali", last_name: "Dao", age: 35 )
    student3 = teacher2.students.create(first_name: "John", last_name: "Dao", age: 21 )
    student4 = teacher2.students.create(first_name: "Drew", last_name: "Dao", age: 26 )

    visit teachers_path

    within(".#{teacher1.last_name}") do
      assert page.has_content?("Mike Dao")
      assert page.has_content?("Oldest Student: 32 Youngest Student: 26")

      within(".students") do
        assert page.has_content?("Kris Foss")
        assert page.has_content?("Ilana Dao")
      end
    end


    within(".#{teacher2.last_name}") do
      assert page.has_content?("Andrew Carmer")
      assert page.has_content?("Oldest Student: 35 Youngest Student: 21")
      
      within(".students") do
        assert page.has_content?("Ali Dao")
        assert page.has_content?("Drew Dao")
      end
    end
  end

end
