class ViewStrugglingStudentsTest < ActionDispatch::IntegrationTest
  test "user can view five struggling students" do


    student1 = teacher1.students.create(first_name: "Cara", last_name: "Engle", age: 32, current_score: 5 )
    student2 = teacher1.students.create(first_name: "Mark", last_name: "Ham", age: 28, current_score: 10 )
    student2 = teacher1.students.create(first_name: "Judas", last_name: "Game", age: 26, current_score: 1  )
    student3 = teacher2.students.create(first_name: "Luna", last_name: "Smith", age: 35, current_score: 2 )
    student3 = teacher2.students.create(first_name: "Harry", last_name: "Hanson", age: 21, current_score: 3  )
    student4 = teacher2.students.create(first_name: "Don", last_name: "Snarf", age: 26, current_score: 7 )

    visit students_path

    within(".#{teacher1.last_name}") do
      assert page.has_content?("Mike Dao")
      assert page.has_content?("Oldest Student: 32 Youngest Student: 26")

      within(".students") do
        assert page.has_content?("Kris Foss")
        assert page.has_content?("Ilana Dao")
      end
    end
  end
end
