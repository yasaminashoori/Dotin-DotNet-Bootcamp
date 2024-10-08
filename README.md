 #  🥇 Dotin_DotNet_Bootcamp

 ### 🔴 Feel free to discover and contribute.
 

- Checklitst ( what i had read and learned), this repo will update!
  

### ✨This is my project and practice for Dotin Bootcamp 1402.

1. Mr.Sadr Resources and refer links:

- <a href="https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/operators/bitwise-and-shift-operators">Bitwise MDN</a>

2. My Practice

### 2.1-<a href="https://github.com/yasaminashoori/Dotin-DotNet-Bootcamp/tree/master/CSProjects/MVCExamples">Guess Number MVC with playing song 🎲🎵</a>

![GuessNUmber](https://github.com/yasaminashoori/Dotin-DotNet-Bootcamp/assets/96047848/999f21e9-a1d4-409f-ac0c-c83ef41964d5)

### 2.2- <a href="https://github.com/yasaminashoori/Dotin-DotNet-Bootcamp/tree/master/CSProjects/SeparatorPractice">Separator Practice ⚙️</a>

Output:

```
Person 1 Infos: ali,alavi,32,M
Person 2 Infos: reza,rezaee,55,M
Person 3 Infos: mona,monaee,54,F
The average age of females for mona: 54
The average age for males ali, reza: 43
```

### 2.3- <a href="https://github.com/yasaminashoori/Dotin-DotNet-Bootcamp/tree/master/CSProjects/AbbreviationShowName">Abbreviation Name and get the user's time for welcome</a>

Output:

```
Enter your firstname:yas
Enter your lastname:ashoori
Welcome Y.A
It's 17 PM yas Good Afternoon :D
```

### 2.4- <a href="https://github.com/yasaminashoori/Dotin-DotNet-Bootcamp/tree/master/CSProjects/TimeSpan">Time Span with OOP ⏳</a>

Output:

```
Maede Zohrabi
Yasamin Ashoori
The difference of the user BirthDate is: 35 Days.

```

### 2-5- <a href="https://github.com/yasaminashoori/Dotin-DotNet-Bootcamp/tree/master/Dotin_C%23_Projects/TimeSpan_Example">Time Span usage as Counter</a>

Output:

```
Enter the duration in seconds: 10
Countdown started!
Time remaining: 00:10
Time remaining: 00:09
Time remaining: 00:08
Time remaining: 00:07
Time remaining: 00:06
Time remaining: 00:05
Time remaining: 00:04
Time remaining: 00:03
Time remaining: 00:02
Time remaining: 00:01
Countdown complete!
```

### 2.6- <a href="https://github.com/yasaminashoori/Dotin-DotNet-Bootcamp/tree/master/CSProjects/DirectoryFile">Directory File 📄</a>

Output:

```
File Name: ._Rec 0031.mp4
File Length: 4 KB
File Extension: .mp4

File Name: 1.csv
File Length: 118 KB
File Extension: .csv

MehranUpdateSP.sql Size:1 KB
MehranSelectFilter.sql Size:3 KB
MehranInsert1.sql Size:3 KB
._Rec 0031.mp4 Size:4 KB
MehranInsertPerson.sql Size:4 KB
Queries.zip Size:5 KB
exercise_files (1).zip Size:9 KB
1_7EvUAk0-QC2ar3QhWNa9uQ.webp Size:14 KB
8999358.png Size:25 KB
ModleErNew.vsdx Size:69 KB
C#.pdf Size:9337 KB

The count of files: 4
The counted items are: MehranInsert1.sql
The counted items are: MehranInsertPerson.sql
The counted items are: MehranSelectFilter.sql
The counted items are: MehranUpdateSP.sql
The Hidden items: C:\Users\Yasi\Desktop\gitFile\1.csv
The Hidden items: C:\Users\Yasi\Desktop\gitFile\1500x500.jpg
```

### 2.7- <a href="https://github.com/yasaminashoori/Dotin-DotNet-Bootcamp/tree/master/CSProjects/DirectoryFile">MVC Session 10: Table of Products📄</a>

![Screenshot 2024-01-28 213827](https://github.com/yasaminashoori/Dotin-DotNet-Bootcamp/assets/96047848/d36bae98-8174-46a0-b10e-3d98c32c575f)

Index3:

```
@model List<SampleData.Shopping.GetProducts>
<div>
    <h1 class="display-4">Products page 3</h1>
    <table class="table table-striped">
        <thead>
            <tr>
                <th>Title</th>
                <th>Price</th>
            </tr>
        </thead>
        <tbody>
            @foreach (var product in Model)
            {
                <tr>
                    <td class="bg-info">@product.Title</td>
                    <td class="bg-danger">@product.Price</td>
                </tr>
            }
        </tbody>
    </table>
</div>
```

PersonController:

```
 public IActionResult Index3()
 {
     var products = SampleData.Shopping.GetProducts();
     return View(products);
 }

```

- <a href="https://github.com/yasaminashoori/Dotin-DotNet-Bootcamp/tree/master/CSProjects/CSProjects_Part01">Session1 Practice</a>
- <a href="https://github.com/yasaminashoori/Dotin-DotNet-Bootcamp/tree/master/CSProjects/CSProjects_Part02">Session2 Practice</a>
- <a href="https://github.com/yasaminashoori/Dotin-DotNet-Bootcamp/tree/master/CSProjects/CSProjects_Part03">Session3 Practice</a>

### 2.8- <a href="">Practice with Query Strings in URLs</a>

### 2.9- NHibernate project

### 3- Frontend project: Slot Machine

### ⌛📋 The Questions and Answers of C# Quiz:

- <a href="https://github.com/yasaminashoori/Dotin-DotNet-Bootcamp/tree/master/C%23_Quiz">C# Quiz</a>

### 🖊️📝 Articles Written by me for Dotin tasks or more information

1. <a href="https://github.com/yasaminashoori/Dotin-DotNet-Bootcamp/blob/master/Articles/IActionResult.pdf">IActionResult</a>

2. <a href="https://github.com/yasaminashoori/Dotin-DotNet-Bootcamp/blob/master/Articles/ViewBag_ViewData_TempData.pdf">ViewBag ViewData TempData</a>

3. <a href="">lifetimes: Singleton, Transient, Scoped</a>

### Topics from SQL, C#, NH, .NET and others...

1. How to make a Solution, structure of making a project
2. Helper Methods
