import 'dart:convert';

import 'package:jet_news_app/core/result/result.dart';
import 'package:jet_news_app/domain/model/news/news.dart';

class NewsFakeDataSource {
  Future<Result<List<News>>> requestNews(int page) async {
    try {
      final List jsonResult = jsonDecode(fakeNewsData);

      final List<News> newsList =
          jsonResult.map((json) => News.fromJson(json)).toList();
      return Result.success(newsList);
    } catch (e) {
      return Result.error('$runtimeType.requestNews : 에러 발생 \n$e');
    }
  }
}

const fakeNewsData = '''
[
  {
    "id": "dc523f0ed25c",
    "imageId": 2131165292,
    "imageThumbId": 2131165293,
    "metadata": {
      "author": {
        "name": "Pietro Maggi",
        "url": "https://medium.com/@pmaggi"
      },
      "date": "August 02",
      "readTimeMinutes": 1
    },
    "paragraphs": [
      {
        "markups": [],
        "text": "Working to make our Android application more modular, I ended up with a sample that included a set of on-demand features grouped inside a folder:",
        "type": "Text"
      },
      {
        "markups": [],
        "text": "Pretty standard setup, all the on-demand modules, inside a “features” folder; clean.",
        "type": "Text"
      },
      {
        "markups": [],
        "text": "These modules are included in the settings.gradle file as:",
        "type": "Text"
      },
      {
        "markups": [],
        "text": "include \\u0027:app\\u0027\\ninclude \\u0027:features:module1\\u0027\\ninclude \\u0027:features:module2\\u0027\\ninclude \\u0027:features:module3\\u0027\\ninclude \\u0027:features:module4\\u0027",
        "type": "CodeBlock"
      },
      {
        "markups": [],
        "text": "These setup works nicely with a single “minor” issue: an empty module named features in the Android view in Android Studio:",
        "type": "Text"
      },
      {
        "markups": [],
        "text": "I can live with that, but I would much prefer to remove that empty module from my project!",
        "type": "Text"
      },
      {
        "markups": [],
        "text": "If you cannot remove it, just rename it!",
        "type": "Header"
      },
      {
        "markups": [
          {
            "end": 72,
            "start": 41,
            "type": "Italic"
          }
        ],
        "text": "At I/O I was lucky enough to attend the “Android Studio: Tips and Tricks” talk where Ivan Gravilovic, from Google, shared some amazing tips. One of these was a possible solution for my problem: setting a custom path for my modules.",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 43,
            "start": 28,
            "type": "Code"
          }
        ],
        "text": "In this particular case our settings.gradle becomes:",
        "type": "Text"
      },
      {
        "markups": [],
        "text": "include \\u0027:app\\u0027\\ninclude \\u0027:module1\\u0027\\ninclude \\u0027:module1\\u0027\\ninclude \\u0027:module1\\u0027\\ninclude \\u0027:module1\\u0027",
        "type": "CodeBlock"
      },
      {
        "markups": [],
        "text": "// Set a custom path for the four features modules.\\n// This avoid to have an empty \\"features\\" module in  Android Studio.\\nproject(\\":module1\\").projectDir\\u003dnew File(rootDir, \\"features/module1\\")\\nproject(\\":module2\\").projectDir\\u003dnew File(rootDir, \\"features/module2\\")\\nproject(\\":module3\\").projectDir\\u003dnew File(rootDir, \\"features/module3\\")\\nproject(\\":module4\\").projectDir\\u003dnew File(rootDir, \\"features/module4\\")",
        "type": "CodeBlock"
      },
      {
        "markups": [],
        "text": "And the layout in Android Studio is now:",
        "type": "Text"
      },
      {
        "markups": [],
        "text": "Conclusion",
        "type": "Header"
      },
      {
        "markups": [],
        "text": "As the title says, this is really a small thing, but it helps keep my project in order and it shows how a small Gradle configuration can help keep your project tidy.",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 79,
            "href": "https://codelabs.developers.google.com/codelabs/on-demand-dynamic-delivery/index.html",
            "start": 54,
            "type": "Link"
          }
        ],
        "text": "You can find this update in the latest version of the on-demand modules codelab.",
        "type": "Quote"
      },
      {
        "markups": [],
        "text": "Resources",
        "type": "Header"
      },
      {
        "markups": [
          {
            "end": 47,
            "href": "https://www.youtube.com/watch?v\\u003dihF-PwDfRZ4\\u0026list\\u003dPLWz5rJ2EKKc9FfSQIRXEWyWpHD6TtwxMM\\u0026index\\u003d32\\u0026t\\u003d0s",
            "start": 0,
            "type": "Link"
          }
        ],
        "text": "Android Studio: Tips and Tricks (Google I/O’19)",
        "type": "Bullet"
      },
      {
        "markups": [
          {
            "end": 24,
            "href": "https://codelabs.developers.google.com/codelabs/on-demand-dynamic-delivery/index.html",
            "start": 0,
            "type": "Link"
          }
        ],
        "text": "On Demand module codelab",
        "type": "Bullet"
      },
      {
        "markups": [
          {
            "end": 40,
            "href": "https://medium.com/androiddevelopers/a-patchwork-plaid-monolith-to-modularized-app-60235d9f212e",
            "start": 0,
            "type": "Link"
          }
        ],
        "text": "Patchwork Plaid — A modularization story",
        "type": "Bullet"
      }
    ],
    "publication": {
      "logoUrl": "https://cdn-images-1.medium.com/max/258/1*u7oZc2_5mrkcFaxkXEyfYA@2x.png",
      "name": "Android Developers"
    },
    "subtitle": "How to configure your module paths, instead of using Gradle’s default.",
    "title": "A Little Thing about Android Module Paths",
    "url": "https://medium.com/androiddevelopers/gradle-path-configuration-dc523f0ed25c"
  },
  {
    "id": "7446d8dfd7dc",
    "imageId":2131165294,
    "imageThumbId": 2131165295,
    "metadata": {
      "author": {
        "name": "Manuel Vivo",
        "url": "https://medium.com/@manuelvicnt"
      },
      "date": "July 30",
      "readTimeMinutes": 3
    },
    "paragraphs": [
      {
        "markups": [
          {
            "end": 6,
            "href": "https://dagger.dev/",
            "start": 0,
            "type": "Link"
          }
        ],
        "text": "Dagger is a popular Dependency Injection framework commonly used in Android. It provides fully static and compile-time dependencies addressing many of the development and performance issues that have reflection-based solutions.",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 26,
            "href": "https://dagger.dev/tutorial/",
            "start": 14,
            "type": "Link"
          },
          {
            "end": 132,
            "start": 114,
            "type": "Bold"
          },
          {
            "end": 159,
            "start": 144,
            "type": "Bold"
          },
          {
            "end": 198,
            "start": 191,
            "type": "Bold"
          }
        ],
        "text": "This month, a new tutorial was released to help you better understand how it works. This article focuses on using Dagger with Kotlin, including best practices to optimize your build time and gotchas you might encounter.",
        "type": "Text"
      },
      {
        "markups": [],
        "text": "Dagger is implemented using Java’s annotations model and annotations in Kotlin are not always directly parallel with how equivalent Java code would be written. This post will highlight areas where they differ and how you can use Dagger with Kotlin without having a headache.",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 70,
            "href": "https://github.com/google/dagger/issues/900",
            "start": 58,
            "type": "Link"
          }
        ],
        "text": "This post was inspired by some of the suggestions in this Dagger issue that goes through best practices and pain points of Dagger in Kotlin. Thanks to all of the contributors that commented there!",
        "type": "Text"
      },
      {
        "markups": [],
        "text": "kapt build improvements",
        "type": "Header"
      },
      {
        "markups": [
          {
            "end": 104,
            "href": "https://github.com/google/dagger/releases/tag/dagger-2.18",
            "start": 99,
            "type": "Link"
          },
          {
            "end": 148,
            "href": "https://github.com/google/dagger/releases/tag/dagger-2.24",
            "start": 143,
            "type": "Link"
          },
          {
            "end": 95,
            "start": 53,
            "type": "Bold"
          }
        ],
        "text": "To improve your build time, Dagger added support for gradle’s incremental annotation processing in v2.18! This is enabled by default in Dagger v2.24. In case you’re using a lower version, you need to add a few lines of code (as shown below) if you want to benefit from it.",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 97,
            "href": "https://github.com/google/dagger/releases/tag/dagger-2.18",
            "start": 92,
            "type": "Link"
          },
          {
            "end": 170,
            "href": "https://github.com/google/dagger/releases/tag/dagger-2.23",
            "start": 165,
            "type": "Link"
          }
        ],
        "text": "Also, you can tell Dagger not to format the generated code. This option was added in Dagger v2.18 and it’s the default behavior (doesn’t generate formatted code) in v2.23. If you’re using a lower version, disable code formatting to improve your build time (see code below).",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 53,
            "start": 41,
            "type": "Code"
          }
        ],
        "text": "Include these compiler arguments in your build.gradle file to make Dagger more performant at build time:",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 97,
            "start": 81,
            "type": "Code"
          }
        ],
        "text": "Alternatively, if you use Kotlin DSL script files, include them like this in the build.gradle.kts file of the modules that use Dagger:",
        "type": "Text"
      },
      {
        "markups": [],
        "text": "Qualifiers for field attributes",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 0,
            "start": 0,
            "type": "Link"
          }
        ],
        "text": "",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 187,
            "start": 181,
            "type": "Code"
          },
          {
            "end": 285,
            "href": "http://frogermcs.github.io/dependency-injection-with-dagger-2-custom-scopes/",
            "start": 268,
            "type": "Link"
          },
          {
            "end": 119,
            "start": 114,
            "type": "Italic"
          },
          {
            "end": 149,
            "start": 143,
            "type": "Italic"
          }
        ],
        "text": "When an annotation is placed on a property in Kotlin, it’s not clear whether Java will see that annotation on the field of the property or the method for that property. Setting the field: prefix on the annotation ensures that the qualifier ends up in the right place (See documentation for more details).",
        "type": "Text"
      },
      {
        "markups": [],
        "text": "✅ The way to apply qualifiers on an injected field is:",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 29,
            "start": 8,
            "type": "Bold"
          }
        ],
        "text":"@Inject @field:MinimumBalance lateinit var minimumBalance: BigDecimal",
        "type": "CodeBlock"
      },
      {
        "markups": [],
        "text": "❌ As opposed to:",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 95,
            "start": 65,
            "type": "Bold"
          }
        ],
        "text": "@Inject @MinimumBalance lateinit var minimumBalance: BigDecimal \\n// @MinimumBalance is ignored!",
        "type": "CodeBlock"
      },
      {
        "markups": [
          {
            "end": 24,
            "start": 18,
            "type": "Code"
          }
        ],
        "text": "Forgetting to add field: could lead to injecting the wrong object if there’s an unqualified instance of that type available in the Dagger graph.",
        "type": "Text"
      },
      {
        "markups": [],
        "text": "Static @Provides functions optimization",
        "type": "Header"
      },
      {
        "markups": [
          {
            "end": 60,
            "start": 51,
            "type": "Code"
          },
          {
            "end": 79,
            "start": 73,
            "type": "Code"
          },
          {
            "end": 127,
            "start": 121,
            "type": "Code"
          },
          {
            "end": 146,
            "start": 141,
            "type": "Code"
          },
          {
            "end": 188,
            "start": 178,
            "type": "Code"
          },
          {
            "end": 213,
            "start": 200,
            "type": "Bold"
          },
          {
            "end": 213,
            "start": 200,
            "type": "Italic"
          }
        ],
        "text": "Dagger’s generated code will be more performant if @Provides methods are static. To achieve this in Kotlin, use a Kotlin object instead of a class and annotate your methods with @JvmStatic. This is a best practice that you should follow as much as possible.",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 70,
            "start": 60,
            "type": "Code"
          },
          {
            "end": 128,
            "start": 121,
            "type": "Code"
          }
        ],
        "text": "In case you need an abstract method, you’ll need to add the @JvmStatic method to a companion object and annotate it with @Module too.",
        "type": "Text"
      },
      {
        "markups": [],
        "text": "Alternatively, you can extract the object module out and include it in the abstract one:",
        "type": "Text"
      },
      {
        "markups": [],
        "text": "Injecting Generics",
        "type": "Header"
      },
      {
        "markups": [
          {
            "end": 193,
            "start": 184,
            "type": "Code"
          },
          {
            "end": 233,
            "start": 216,
            "type": "Code"
          },
          {
            "end": 146,
            "href": "https://kotlinlang.org/docs/reference/java-to-kotlin-interop.html#variant-generics",
            "start": 132,
            "type": "Link"
          }
        ],
        "text": "Kotlin compiles generics with wildcards to make Kotlin APIs work with Java. These are generated when a type appears as a parameter (more info here) or as fields. For example, a Kotlin List\\u003cFoo\\u003e parameter shows up as List\\u003c? super Foo\\u003e in Java.",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 116,
            "start": 95,
            "type": "Code"
          },
          {
            "end": 75,
            "href": "https://en.wikipedia.org/wiki/Class_invariant",
            "start": 66,
            "type": "Link"
          },
          {
            "end": 116,
            "href": "https://kotlinlang.org/api/latest/jvm/stdlib/kotlin.jvm/-jvm-suppress-wildcards/index.html",
            "start": 96,
            "type": "Link"
          }
        ],
        "text": "This causes problems with Dagger because it expects an exact (aka invariant) type match. Using @JvmSuppressWildcards will ensure that Dagger sees the type without wildcards.",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 86,
            "href": "https://dagger.dev/multibindings.html",
            "start": 57,
            "type": "Link"
          }
        ],
        "text": "This is a common issue when you inject collections using Dagger’s multibinding feature, for example:",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 93,
            "start": 72,
            "type": "Bold"
          }
        ],
        "text": "class MyVMFactory @Inject constructor(\\n  private val vmMap: Map\\u003cString, @JvmSuppressWildcards Provider\\u003cViewModel\\u003e\\u003e\\n) { \\n    ... \\n}",
        "type": "CodeBlock"
      },
      {
        "markups": [],
        "text": "Inline method bodies",
        "type": "Header"
      },
      {
        "markups": [
          {
            "end": 60,
            "start": 51,
            "type": "Code"
          }
        ],
        "text": "Dagger determines the types that are configured by @Provides methods by inspecting the return type. Specifying the return type in Kotlin functions is optional and even the IDE sometimes encourages you to refactor your code to have inline method bodies that hide the return type declaration.",
        "type": "Text"
      },
      {
        "markups": [],
        "text": "This can lead to bugs if the inferred type is different from the one you meant. Let’s see some examples:",
        "type": "Text"
      },
      {
        "markups": [],
        "text": "If you want to add a specific type to the graph, inlining works as expected. See the different ways to do the same in Kotlin:",
        "type": "Text"
      },
      {
        "markups": [],
        "text": "If you want to provide an implementation of an interface, then you must explicitly specify the return type. Not doing it can lead to problems and bugs:",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 162,
            "start": 155,
            "type": "Code"
          },
          {"end": 246,
            "start": 225,
            "type": "Code"
          }
        ],
        "text": "Dagger mostly works with Kotlin out of the box. However, you have to watch out for a few things just to make sure you’re doing what you really mean to do: @field: for qualifiers on field attributes, inline method bodies, and @JvmSuppressWildcards when injecting collections.",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 194,
            "start": 185,
            "type": "Code"
          }
        ],
        "text": "Dagger optimizations come with no cost, add them and follow best practices to improve your build time: enabling incremental annotation processing, disabling formatting and using static @Provides methods in your Dagger modules.",
        "type": "Text"
      }
    ],
    "publication": {
      "logoUrl": "https://cdn-images-1.medium.com/max/258/1*u7oZc2_5mrkcFaxkXEyfYA@2x.png",
      "name": "Android Developers"
    },
    "subtitle": "Use Dagger in Kotlin! This article includes best practices to optimize your build time and gotchas you might encounter.",
    "title": "Dagger in Kotlin: Gotchas and Optimizations",
    "url": "https://medium.com/androiddevelopers/dagger-in-kotlin-gotchas-and-optimizations-7446d8dfd7dc"
  },
  {
    "id": "ac552dcc1741",
    "imageId": 2131165296,
    "imageThumbId": 2131165297,
    "metadata": {
      "author": {
        "name": "Florina Muntenescu",
        "url": "https://medium.com/@florina.muntenescu"
      },
      "date": "July 09",
      "readTimeMinutes": 1
    },
    "paragraphs": [
      {
        "markups": [
          {
            "end": 172,
            "href": "https://codelabs.developers.google.com/codelabs/java-to-kotlin/#0",
            "start": 151,
            "type": "Link"
          },
          {
            "end": 216,
            "href": "https://clmirror.storage.googleapis.com/codelabs/java-to-kotlin-zh/index.html#0",
            "start": 209,
            "type": "Link"
          },
          {
            "end": 246,
            "href": "https://codelabs.developers.google.com/codelabs/java-to-kotlin-pt-br/#0",
            "start": 226,
            "type": "Link"
          }
        ],
        "text": "Learn how to get started converting Java Programming Language code to Kotlin, making it more idiomatic and avoid common pitfalls, by following our new Refactoring to Kotlin codelab, available in English 🇬🇧, Chinese 🇨🇳 and Brazilian Portuguese 🇧🇷.",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 124,
            "href": "https://www.jetbrains.com/help/idea/converting-a-java-file-to-kotlin-file.html",
            "start": 105,
            "type": "Link"
          }
        ],
        "text": "When you first get started writing Kotlin code, you tend to follow Java Programming Language idioms. The automatic converter, part of both Android Studio and Intellij IDEA, can do a pretty good job of automatically refactoring your code, but sometimes, it needs a little help. This is where our new Refactoring to Kotlin codelab comes in.",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 30,
            "start": 26,
            "type": "Code"
          },
          {
            "end": 47,
            "start": 37,
            "type": "Code"
          }
        ],
        "text": "We’ll take two classes (a User and a Repository) in Java Programming Language and convert them to Kotlin, check out what the automatic converter did and why. Then we go to the next level — make it idiomatic, teaching best practices and useful tips along the way.",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 251,
            "start": 245,
            "type": "Code"
          },
          {
            "end": 365,
            "start": 359,
            "type": "Code"
          },
          {
            "end": 25,
            "href": "https://codelabs.developers.google.com/codelabs/java-to-kotlin/#0",
            "start": 4,
            "type": "Link"
          }
        ],
        "text": "The Refactoring to Kotlin codelab starts with basic topics — understand how nullability is declared in Kotlin, what types of equality are defined or how to best handle classes whose role is just to hold data. We then continue with how to handle static fields and functions in Kotlin and how to apply the Singleton pattern, with the help of one handy keyword: object. We’ll see how Kotlin helps us model our classes better, how it differentiates between a property of a class and an action the class can do. Finally, we’ll learn how to execute code only in the context of a specific object with the scope functions.",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 42,
            "href": "https://codelabs.developers.google.com/codelabs/java-to-kotlin/#0",
            "start": 21,
            "type": "Link"
          }
        ],
        "text": "Thanks to Walmyr Carvalho and Nelson Glauber for translating the codelab in Brazilian Portuguese!",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 96,
            "href": "https://codelabs.developers.google.com/codelabs/java-to-kotlin-pt-br/#0",
            "start": 76,"type": "Link"
          }
        ],
        "text": "",
        "type": "Text"
      }
    ],
    "publication": {
      "logoUrl": "https://cdn-images-1.medium.com/max/258/1*u7oZc2_5mrkcFaxkXEyfYA@2x.png",
      "name": "Android Developers"
    },
    "subtitle": "Learn how to get started converting Java Programming Language code to Kotlin, making it more idiomatic and avoid common pitfalls, by…",
    "title": "From Java Programming Language to Kotlin — the idiomatic way",
    "url": "https://medium.com/androiddevelopers/from-java-programming-language-to-kotlin-the-idiomatic-way-ac552dcc1741"
  },
  {
    "id": "84eb677660d9",
    "imageId": 2131165298,
    "imageThumbId": 2131165299,
    "metadata": {
      "author": {
        "name": "Jose Alcérreca",
        "url": "https://medium.com/@JoseAlcerreca"
      },
      "date": "April 02",
      "readTimeMinutes": 1
    },
    "paragraphs": [
      {
        "markups": [],
        "text": "TL;DR: Expose resource IDs from ViewModels to avoid showing obsolete data.",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 197,
            "start": 183,
            "type": "Bold"
          }
        ],
        "text": "In a ViewModel, if you’re exposing data coming from resources (strings, drawables, colors…), you have to take into account that ViewModel objects ignore configuration changes such as locale changes. When the user changes their locale, activities are recreated but the ViewModel objects are not.",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 16,
            "start": 0,
            "type": "Code"
          },
          {
            "end": 43,
            "start": 34,
            "type": "Code"
          },
          {
            "end": 303,
            "start": 209,
            "type": "Bold"
          }
        ],
        "text": "AndroidViewModel is a subclass of ViewModel that is aware of the Application context. However, having access to a context can be dangerous if you’re not observing or reacting to the lifecycle of that context. The recommended practice is to avoid dealing with objects that have a lifecycle in ViewModels.",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 103,
            "href": "https://issuetracker.google.com/issues/111961971",
            "start": 61,
            "type": "Link"
          },
          {
            "end": 104,
            "start": 61,
            "type": "Italic"
          }
        ],
        "text": "Let’s look at an example based on this issue in the tracker: Updating ViewModel on system locale change.",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 133,
            "start": 73,
            "type": "Bold"
          }
        ],
        "text": "The problem is that the string is resolved in the constructor only once. If there’s a locale change, the ViewModel won’t be recreated. This will result in our app showing obsolete data and therefore being only partially localized.",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 9,
            "href": "https://twitter.com/ZelenetS",
            "start": 3,
            "type": "Link"
          },
          {
            "end": 36,
            "href": "https://issuetracker.google.com/issues/111961971#comment2",
            "start": 28,
            "type": "Link"
          },
          {
            "end": 150,
            "start": 82,
            "type": "Bold"
          }
        ],
        "text": "As Sergey points out in the comments to the issue, the recommended approach is to expose the ID of the resource you want to load and do so in the view. As the view (activity, fragment, etc.) is lifecycle-aware it will be recreated after a configuration change so the resource will be reloaded correctly.",
        "type": "Text"
      },
      {
        "markups": [],
        "text": "Even if you don’t plan to localize your app, it makes testing much easier and cleans up your ViewModel objects so there’s no reason not to future-proof.",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 70,
            "href": "https://github.com/googlesamples/android-architecture/pull/631",
            "start": 66,
            "type": "Link"
          },
          {
            "end": 81,
            "href": "https://github.com/googlesamples/android-architecture/pull/635",
            "start": 75,
            "type": "Link"
          },
          {
            "end": 151,
            "href": "https://github.com/googlesamples/android-architecture/pull/635/files#diff-7eb5d85ec3ea4e05ecddb7dc8ae20aa1R62",
            "start": 128,
            "type": "Link"
          }
        ],
        "text": "We fixed this issue in the android-architecture repository in the Java and Kotlin branches and we offloaded resource loading to the Data Binding layout.",
        "type": "Text"
      }
    ],
    "publication": {
      "logoUrl": "https://cdn-images-1.medium.com/max/258/1*u7oZc2_5mrkcFaxkXEyfYA@2x.png",
      "name": "Android Developers"
    },
    "subtitle": "TL;DR: Expose resource IDs from ViewModels to avoid showing obsolete data.",
    "title": "Locale changes and the AndroidViewModel antipattern",
    "url": "https://medium.com/androiddevelopers/locale-changes-and-the-androidviewmodel-antipattern-84eb677660d9"
  },
  {
    "id": "55db18283aca",
    "imageId": 2131165300,
    "imageThumbId": 2131165301,
    "metadata": {
      "author": {
        "name": "Florina Muntenescu",
        "url": "https://medium.com/@florina.muntenescu"
      },
      "date": "July 24",
      "readTimeMinutes": 4
    },
    "paragraphs": [
      {
        "markups": [
          {
            "end": 220,
            "start": 210,
            "type": "Code"
          },
          {
            "end": 249,
            "start": 241,
            "type": "Code"
          },
          {
            "end": 221,
            "href": "https://kotlinlang.org/api/latest/jvm/stdlib/kotlin.collections/index.html",
            "start": 210,
            "type": "Link"
          },
          {
            "end": 250,
            "href": "https://kotlinlang.org/api/latest/jvm/stdlib/kotlin.sequences/index.html",
            "start": 241,
            "type": "Link"
          },
          {
            "end": 134,
            "start": 130,
            "type": "Bold"
          },
          {
            "end": 202,
            "start": 195,
            "type": "Bold"
          },
          {
            "end": 233,
            "start": 227,
            "type": "Bold"
          },
          {
            "end": 134,
            "start": 130,
            "type": "Italic"
          }
        ],
        "text": "Working with collections is a common task and the Kotlin Standard Library offers many great utility functions. It also offers two ways of working with collections based on how they’re evaluated: eagerly — with Collections, and lazily — with Sequences. Continue reading to find out what’s the difference between the two, which one you should use and when, and what the performance implications of each are.",
        "type": "Text"
      },
      {
        "markups": [],
        "text": "Collections vs sequences",
        "type": "Header"
      },
      {
        "markups": [
          {
            "end": 61,
            "start": 57,
            "type": "Italic"
          }
        ],
        "text": "The difference between eager and lazy evaluation lies in when each transformation on the collection is performed.",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 232,
            "start": 229,
            "type": "Code"
          },
          {
            "end": 279,
            "start": 273,
            "type": "Code"
          },
          {
            "end": 318,
            "start": 309,
            "type": "Code"
          },
          {
            "end": 199,
            "href": "https://kotlinlang.org/docs/reference/inline-functions.html",
            "start": 183,
            "type": "Link"
          },
          {
            "end": 232,
            "href": "https://github.com/JetBrains/kotlin/blob/master/libraries/stdlib/common/src/generated/_Collections.kt#L1312",
            "start": 229,
            "type": "Link"
          },
          {
            "end": 12,
            "start": 0,
            "type": "Bold"
          },
          {
            "end": 23,
            "start": 16,
            "type": "Italic"
          }
        ],
        "text": "Collections are eagerly evaluated — each operation is performed when it’s called and the result of the operation is stored in a new collection. The transformations on collections are inline functions. For example, looking at how map is implemented, we can see that it’s an inline function, that creates a new ArrayList:",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 13,
            "start": 7,
            "type": "Bold"
          },
          {
            "end": 97,
            "start": 88,
            "type": "Bold"
          }
        ],
        "text": "public inline fun \\u003cT, R\\u003e Iterable\\u003cT\\u003e.map(transform: (T) -\\u003e R): List\\u003cR\\u003e {\\n  return mapTo(ArrayList\\u003cR\\u003e(collectionSizeOrDefault(10)), transform)\\n}",
        "type": "CodeBlock"
      },
      {
        "markups": [
          {
            "end": 3600,
            "start": 357,
            "type": "Code"
          },
          {
            "end": 370,
            "start": 362,
            "type": "Code"
          },
          {
            "end": 379,
            "start": 372,
            "type": "Code"
          },
          {
            "end": 448,
            "start": 443,
            "type": "Code"
          },
          {
            "end": 456,
            "start": 450,
            "type": "Code"
          },
          {
            "end": 463,
            "start": 458,
            "type": "Code"
          },
          {
            "end": 9,
            "start": 0,
            "type": "Bold"
          },
          {
            "end": 79,
            "start": 67,
            "type": "Bold"
          },
          {
            "end": 92,
            "start": 84,
            "type": "Bold"
          },
          {
            "end": 269,
            "start": 254,
            "type": "Bold"
          },
          {
            "end": 20,
            "start": 14,
            "type": "Italic"
          }
        ],
        "text": "Sequences are lazily evaluated. They have two types of operations: intermediate and terminal. Intermediate operations are not performed on the spot; they’re just stored. Only when a terminal operation is called, the intermediate operations are triggered on each element in a row and finally, the terminal operation is applied. Intermediate operations (like map, distinct, groupBy etc) return another sequence whereas terminal operations (like first, toList, count etc) don’t.",
        "type": "Text"
      },
      {
        "markups": [],
        "text": "Sequences don’t hold a reference to the items of the collection. They’re created based on the iterator of the original collection and keep a reference to all the intermediate operations that need to be performed.",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 225,
            "start": 222,
            "type": "Code"
          },
          {
            "end": 320,
            "start": 312,
            "type": "Code"
          },
          {
            "end": 225,
            "href": "https://github.com/JetBrains/kotlin/blob/master/libraries/stdlib/common/src/generated/_Sequences.kt#L860",
            "start": 222,
            "type": "Link"
          }
        ],
        "text":"Unlike transformations on collections, intermediate transformations on sequences are not inline functions — inline functions cannot be stored and sequences need to store them. Looking at how an intermediate operation like map is implemented, we can see that the transform function is kept in a new instance of a Sequence:",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 105,
            "start": 85,
            "type": "Bold"
          }
        ],
        "text": "public fun \\u003cT, R\\u003e Sequence\\u003cT\\u003e.map(transform: (T) -\\u003e R): Sequence\\u003cR\\u003e{      \\n   return TransformingSequence(this, transform)\\n}",
        "type": "CodeBlock"
      },
      {
        "markups": [
          {
            "end": 32,
            "start": 27,
            "type": "Code"
          },
          {
            "end": 32,
            "href": "https://github.com/JetBrains/kotlin/blob/master/libraries/stdlib/common/src/generated/_Sequences.kt#L117",
            "start": 27,
            "type": "Link"
          }
        ],
        "text": "A terminal operation, like first, iterates through the elements of the sequence until the predicate condition is matched.",
        "type": "Text"
      },
      {
        "markups": [],
        "text": "public inline fun \\u003cT\\u003e Sequence\\u003cT\\u003e.first(predicate: (T) -\\u003e Boolean): T {\\n   for (element in this) if (predicate(element)) return element\\n   throw NoSuchElementException(“Sequence contains no element matching the predicate.”)\\n}",
        "type": "CodeBlock"
      },
      {
        "markups": [
          {
            "end": 54,
            "start": 34,
            "type": "Code"
          },
          {
            "end": 71,
            "start": 68,
            "type": "Code"
          }
        ],
        "text": "If we look at how a sequence like TransformingSequence (used in the map above) is implemented, we’ll see that when next is called on the sequence iterator, the transformation stored is also applied.",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 120,
            "start": 109,
            "type": "Bold"
          }
        ],
        "text": "internal class TransformingIndexedSequence\\u003cT, R\\u003e \\nconstructor(private val sequence: Sequence\\u003cT\\u003e, private val transformer: (Int, T) -\\u003e R) : Sequence\\u003cR\\u003e {",
        "type": "CodeBlock"
      },
      {
        "markups": [
          {
            "end": 89,
            "start": 83,
            "type": "Bold"
          },
          {
            "end": 118,
            "start": 107,
            "type": "Bold"
          }
        ],
        "text": "override fun iterator(): Iterator\\u003cR\\u003e \\u003d object : Iterator\\u003cR\\u003e {\\n   …\\n   override fun next(): R {\\n     return transformer(checkIndexOverflow(index++), iterator.next())\\n   }\\n   …\\n}",
        "type": "CodeBlock"
      },
      {
        "markups": [
          {
            "end": 149,
            "start": 145,
            "type": "Code"
          },
          {
            "end": 157,
            "start": 151,
            "type": "Code"
          },
          {
            "end": 166,
            "start": 159,
            "type": "Code"
          },
          {
            "end": 207,
            "href": "https://kotlinlang.org/api/latest/jvm/stdlib/kotlin.collections/#functions",
            "start": 193,
            "type": "Link"
          }
        ],
        "text": "Independent on whether you’re using collections or sequences, the Kotlin Standard Library offers quite a wide range of operations for both, like find, filter, groupBy and others. Make sure you check them out, before implementing your own version of these.",
        "type": "Text"
      },
      {
        "markups": [],
        "text": "Collections and sequences",
        "type": "Header"
      },
      {
        "markups": [],
        "text": "Let’s say that we have a list of objects of different shapes. We want to make the shapes yellow and then take the first square shape.",
        "type": "Text"
      },
      {
        "markups": [],
        "text": "Let’s see how and when each operation is applied for collections and when for sequences",
        "type": "Text"
      },
      {
        "markups": [],
        "text": "Collections",
        "type": "Subhead"
      },
      {
        "markups": [
          {
            "end": 3,
            "start": 0,
            "type": "Code"
          }
        ],
        "text": "map is called — a new ArrayList is created. We iterate through all items of the initial collection, transform it by copying the original object and changing the color, then add it to the new list.",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 5,
            "start": 0,
            "type": "Code"
          }
        ],
        "text": "first is called — we iterate through each item until the first square is found",
        "type": "Text"
      },
      {
        "markups": [],
        "text": "Sequences",
        "type": "Subhead"
      },
      {
        "markups": [
          {
            "end": 10,
            "start": 0,
            "type": "Code"
          }
        ],
        "text": "asSequence — a sequence is created based on the Iterator of the original collection",
        "type": "Bullet"
      },
      {
        "markups": [
          {
            "end": 3,
            "start": 0,
            "type": "Code"
          },
          {
            "end": 133,
            "start": 130,
            "type": "Bold"
          }
        ],
        "text": "map is called — the transformation is added to the list of operations needed to be performed by the sequence but the operation is NOT performed",
        "type": "Bullet"
      },
      {
        "markups": [
          {
            "end": 5,
            "start": 0,
            "type": "Code"
          }
        ],
        "text":"first is called — this is a terminal operation, so, all the intermediate operations are triggered, on each element of the collection. We iterate throughthe initial collection applying map and then first on each of them. Since the condition from first is satisfied by the 2nd element, then we no longer apply the map on the rest of the collection.",
        "type": "Bullet"
      },
      {
        "markups": [],
        "text": "When working with sequences no intermediate collection is created and since items are evaluated one by one, map is only performed on some of the inputs.",
        "type": "Text"
      },
      {
        "markups": [],
        "text": "Performance",
        "type": "Header"
      },
      {
        "markups": [],
        "text": "Order of transformations",
        "type": "Subhead"
      },
      {
        "markups": [
          {
            "end": 127,
            "start": 122,
            "type": "Code"
          },
          {
            "end": 160,
            "start": 157,
            "type": "Code"
          },
          {
            "end": 200,
            "start": 197,
            "type": "Code"
          }
        ],
        "text": "Independent of whether you’re using collections or sequences, the order of transformations matters. In the example above, first doesn’t need to happen after map since it’s not a consequence of the map transformation. If we reverse the order of our business logic and call first on the collection and then transform the result, then we only create one new object — the yellow square. When using sequences — we avoid creating 2 new objects, when using collections, we avoid creating an entire new list.",
        "type": "Text"
      },
      {
        "markups": [],
        "text": "Because terminal operations can finish processing early, and intermediate operations are evaluated lazily, sequences can, in some cases, help you avoid doing unnecessary work compared to collections. Make sure you always check the order of the transformations and the dependencies between them!",
        "type": "Text"
      },
      {
        "markups": [],
        "text": "Inlining and large data sets consequences",
        "type": "Subhead"
      },
      {
        "markups": [
          {
            "end": 210,
            "start": 202,
            "type": "Code"
          }
        ],
        "text": "Collection operations use inline functions, so the bytecode of the operation, together with the bytecode of the lambda passed to it will be inlined. Sequences don’t use inline functions, therefore, new Function objects are created for each operation.",
        "type": "Text"
      },
      {
        "markups": [],
        "text": "On the other hand, collections create a new list for every transformation while sequences just keep a reference to the transformation function.",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 35,
            "start": 18,
            "type": "Bold"
          },
          {
            "end": 130,
            "start": 119,
            "type": "Bold"
          },
          {
            "end": 179,
            "start": 168,
            "type": "Bold"
          },
          {
            "end": 267,
            "start": 258,
            "type": "Bold"
          }
        ],
        "text": "When working with small collections, with 1–2 operators, these differences don’t have big implications so working with collections should be ok. But, when working with large lists the intermediate collection creation can become expensive; in such cases, use sequences.",
        "type": "Text"
      },
      {
        "markups": [],
        "text": "Unfortunately, I’m not aware of any benchmarking study done that would help us get a better understanding on how the performance of collections vs sequences is affected with different sizes of collections or operation chains.",
        "type": "Text"
      },
      {
        "markups": [],
        "text": "Collections eagerly evaluate your data while sequences do so lazily. Depending on the size of your data, pick the one that fits best: collections — for small lists or sequences — for larger ones, and pay attention to the order of the transformations.",
        "type": "Text"
      }
    ],
    "publication": {
      "logoUrl": "https://cdn-images-1.medium.com/max/258/1*u7oZc2_5mrkcFaxkXEyfYA@2x.png",
      "name": "Android Developers"
    },
    "subtitle": "Working with collections is a common task and the Kotlin Standard Library offers many great utility functions. It also offers two ways of…",
    "title": "Collections and sequences in Kotlin",
    "url": "https://medium.com/androiddevelopers/collections-and-sequences-in-kotlin-55db18283aca"
  },
  {
    "id": "post6",
    "imageId": 2131165292,
    "imageThumbId": 2131165293,
    "metadata": {
      "author": {
        "name": "Pietro Maggi",
        "url": "https://medium.com/@pmaggi"
      },
      "date": "August 02",
      "readTimeMinutes": 1
    },
    "paragraphs": [
      {
        "markups": [],
        "text": "Working to make our Android application more modular, I ended up with a sample that included a set of on-demand features grouped inside a folder:",
        "type": "Text"
      },
      {
        "markups": [],
        "text":"Pretty standard setup, all the on-demand modules, inside a “features”folder; clean.",
        "type": "Text"
      },
      {
        "markups": [],
        "text": "These modules are included in the settings.gradle file as:",
        "type": "Text"
      },
      {
        "markups": [],
        "text": "include \\u0027:app\\u0027\\ninclude \\u0027:features:module1\\u0027\\ninclude \\u0027:features:module2\\u0027\\ninclude \\u0027:features:module3\\u0027\\ninclude \\u0027:features:module4\\u0027",
        "type": "CodeBlock"
      },
      {
        "markups": [],
        "text": "These setup works nicely with a single “minor” issue: an empty module named features in the Android view in Android Studio:",
        "type": "Text"
      },
      {
        "markups": [],
        "text": "I can live with that, but I would much prefer to remove that empty module from my project!",
        "type": "Text"
      },
      {
        "markups": [],
        "text": "If you cannot remove it, just rename it!",
        "type": "Header"
      },
      {
        "markups": [
          {
            "end": 72,
            "start": 41,
            "type": "Italic"
          }
        ],
        "text": "At I/O I was lucky enough to attend the “Android Studio: Tips and Tricks” talk where Ivan Gravilovic, from Google, shared some amazing tips. One of these was a possible solution for my problem: setting a custom path for my modules.",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 43,
            "start": 28,
            "type": "Code"
          }
        ],
        "text": "In this particular case our settings.gradle becomes:",
        "type": "Text"
      },
      {
        "markups": [],
        "text": "include \\u0027:app\\u0027\\ninclude \\u0027:module1\\u0027\\ninclude \\u0027:module1\\u0027\\ninclude \\u0027:module1\\u0027\\ninclude \\u0027:module1\\u0027",
        "type": "CodeBlock"
      },
      {
        "markups": [],
        "text": "// Set a custom path for the four features modules.\\n// This avoid to have an empty \\"features\\" module in  Android Studio.\\nproject(\\":module1\\").projectDir\\u003dnew File(rootDir, \\"features/module1\\")\\nproject(\\":module2\\").projectDir\\u003dnew File(rootDir, \\"features/module2\\")\\nproject(\\":module3\\").projectDir\\u003dnew File(rootDir, \\"features/module3\\")\\nproject(\\":module4\\").projectDir\\u003dnew File(rootDir, \\"features/module4\\")",
        "type": "CodeBlock"
      },
      {
        "markups": [],
        "text": "And the layout in Android Studio is now:",
        "type": "Text"
      },
      {
        "markups": [],
        "text": "Conclusion",
        "type": "Header"
      },
      {
        "markups": [],
        "text": "As the title says, this is really a small thing, but it helps keep my project in order and it shows how a small Gradle configuration can help keep your project tidy.",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 79,
            "href": "https://codelabs.developers.google.com/codelabs/on-demand-dynamic-delivery/index.html",
            "start": 54,
            "type": "Link"
          }
        ],
        "text": "You can find this update in the latest version of the on-demand modules codelab.",
        "type": "Quote"
      },
      {
        "markups": [],
        "text": "Resources",
        "type": "Header"
      },
      {
        "markups": [
          {
            "end": 47,
            "href": "https://www.youtube.com/watch?v\\u003dihF-PwDfRZ4\\u0026list\\u003dPLWz5rJ2EKKc9FfSQIRXEWyWpHD6TtwxMM\\u0026index\\u003d32\\u0026t\\u003d0s",
            "start": 0,
            "type": "Link"
          }
        ],
        "text": "Android Studio: Tips and Tricks (Google I/O’19)",
        "type": "Bullet"
      },
      {
        "markups": [
          {
            "end": 24,
            "href": "https://codelabs.developers.google.com/codelabs/on-demand-dynamic-delivery/index.html",
            "start": 0,
            "type": "Link"
          }
        ],
        "text": "On Demand module codelab",
        "type": "Bullet"
      },
      {
        "markups": [
          {
            "end": 40,
            "href": "https://medium.com/androiddevelopers/a-patchwork-plaid-monolith-to-modularized-app-60235d9f212e",
            "start": 0,
            "type": "Link"
          }
        ],
        "text": "Patchwork Plaid — A modularization story",
        "type": "Bullet"
      }
    ],
    "publication": {
      "logoUrl": "https://cdn-images-1.medium.com/max/258/1*u7oZc2_5mrkcFaxkXEyfYA@2x.png",
      "name": "Android Developers"
    },
    "subtitle": "How to configure your module paths, instead of using Gradle’s default.",
    "title": "A Little Thing about Android Module Paths",
    "url": "https://medium.com/androiddevelopers/gradle-path-configuration-dc523f0ed25c"
  },
  {
    "id": "post7",
    "imageId": 2131165294,
    "imageThumbId": 2131165295,
    "metadata": {
      "author": {
        "name": "Manuel Vivo",
        "url": "https://medium.com/@manuelvicnt"
      },
      "date": "July 30",
      "readTimeMinutes": 3
    },
    "paragraphs": [
      {
        "markups": [
          {
            "end": 6,
            "href": "https://dagger.dev/",
            "start": 0,
            "type": "Link"
          }
        ],
        "text": "Dagger is a popular Dependency Injection framework commonly used in Android. It provides fully static and compile-time dependencies addressing many of the development and performance issues that have reflection-based solutions.",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 26,
            "href": "https://dagger.dev/tutorial/",
            "start": 14,
            "type": "Link"
          },
          {
            "end": 132,
            "start": 114,
            "type": "Bold"
          },
          {
            "end": 159,
            "start": 144,
            "type": "Bold"
          },
          {
            "end": 198,
            "start": 191,
            "type": "Bold"
          }
        ],
        "text": "This month, a new tutorial was released to help you better understand how it works. This article focuses on using Dagger with Kotlin, including best practices to optimize your build time and gotchas you might encounter.",
        "type": "Text"
      },
      {
        "markups": [],
        "text": "Dagger is implemented using Java’s annotations model and annotations in Kotlin are not always directly parallel with how equivalent Java code would be written. This post will highlight areas where they differ and how you can use Dagger with Kotlin without having a headache.",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 70,
            "href": "https://github.com/google/dagger/issues/900",
            "start": 58,
            "type": "Link"
          }
        ],
        "text": "This post was inspired by some of the suggestions in this Dagger issue that goes through best practices and pain points of Dagger in Kotlin. Thanks to all of the contributors that commented there!",
        "type": "Text"
      },
      {
        "markups": [],
        "text": "kapt build improvements",
        "type": "Header"
      },
      {
        "markups": [
          {
            "end": 104,
            "href": "https://github.com/google/dagger/releases/tag/dagger-2.18",
            "start": 99,
            "type": "Link"
          },
          {
            "end": 148,
            "href": "https://github.com/google/dagger/releases/tag/dagger-2.24",
            "start": 143,
            "type": "Link"
          },
          {
            "end": 95,
            "start": 53,
            "type": "Bold"
          }
        ],
        "text": "To improve your build time, Dagger added support for gradle’s incremental annotation processing in v2.18! This is enabled by default in Dagger v2.24. In case you’re using a lower version, you need to add a few lines of code (as shown below) if you want to benefit from it.",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 97,
            "href": "https://github.com/google/dagger/releases/tag/dagger-2.18",
            "start": 92,
            "type": "Link"
          },
          {
            "end": 170,
            "href": "https://github.com/google/dagger/releases/tag/dagger-2.23",
            "start": 165,
            "type": "Link"
          }
        ],
        "text": "Also, you can tell Dagger not to format the generated code. This option was added in Dagger v2.18 and it’s the default behavior (doesn’t generate formatted code) in v2.23. If you’re using a lower version, disable code formatting to improve your build time (see code below).",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 53,
            "start": 41,
            "type": "Code"
          }
        ],
        "text": "Include these compiler arguments in your build.gradle file to make Dagger more performant at build time:",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 97,
            "start": 81,
            "type": "Code"
          }
        ],
        "text": "Alternatively, if you use Kotlin DSL script files, include them like this in the build.gradle.kts file of the modules that use Dagger:",
        "type": "Text"
      },
      {
        "markups": [],
        "text": "Qualifiers for field attributes",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 0,
            "start": 0,
            "type": "Link"
          }
        ],
        "text": "",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 187,
            "start": 181,
            "type": "Code"
          },
          {
            "end": 285,
            "href": "http://frogermcs.github.io/dependency-injection-with-dagger-2-custom-scopes/",
            "start": 268,
            "type": "Link"
          },
          {
            "end": 119,
            "start": 114,
            "type": "Italic"
          },
          {
            "end": 149,
            "start": 143,
            "type": "Italic"
          }
        ],
        "text": "When an annotation is placed on a property in Kotlin, it’s not clear whether Java will see that annotation on the field of the property or the method for that property. Setting the field: prefix on the annotation ensures that the qualifier ends up in the right place (See documentation for more details).",
        "type": "Text"
      },
      {
        "markups": [],
        "text": "✅ The way to apply qualifiers on an injected field is:",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 29,
            "start": 8,
            "type": "Bold"
          }
        ],
        "text": "@Inject @field:MinimumBalance lateinit var minimumBalance: BigDecimal",
        "type": "CodeBlock"
      },
      {
        "markups": [],
        "text": "❌ As opposed to:",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 95,
            "start": 65,
            "type": "Bold"
          }
        ],
        "text": "@Inject @MinimumBalance lateinit var minimumBalance: BigDecimal \\n// @MinimumBalance is ignored!",
        "type": "CodeBlock"
      },
      {
        "markups": [
          {
            "end": 24,
            "start": 18,
            "type": "Code"
          }
        ],
        "text":"Forgetting to add field: could lead to injecting the wrong object if there’s an unqualified instance of that type available inthe Dagger graph.",
        "type": "Text"
      },
      {
        "markups": [],
        "text": "Static @Provides functions optimization",
        "type": "Header"
      },
      {
        "markups": [
          {
            "end": 60,
            "start": 51,
            "type": "Code"
          },
          {
            "end": 79,
            "start": 73,
            "type": "Code"
          },
          {
            "end": 127,
            "start": 121,
            "type": "Code"
          },
          {
            "end": 146,
            "start": 141,
            "type": "Code"
          },
          {
            "end": 188,
            "start": 178,
            "type": "Code"
          },
          {
            "end": 213,
            "start": 200,
            "type": "Bold"
          },
          {
            "end": 213,
            "start": 200,
            "type": "Italic"
          }
        ],
        "text": "Dagger’s generated code will be more performant if @Provides methods are static. To achieve this in Kotlin, use a Kotlin object instead of a class and annotate your methods with @JvmStatic. This is a best practice that you should follow as much as possible.",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 70,
            "start": 60,
            "type": "Code"
          },
          {
            "end": 128,
            "start": 121,
            "type": "Code"
          }
        ],
        "text": "In case you need an abstract method, you’ll need to add the @JvmStatic method to a companion object and annotate it with @Module too.",
        "type": "Text"
      },
      {
        "markups": [],
        "text": "Alternatively, you can extract the object module out and include it in the abstract one:",
        "type": "Text"
      },
      {
        "markups": [],
        "text": "Injecting Generics",
        "type": "Header"
      },
      {
        "markups": [
          {
            "end": 193,
            "start": 184,
            "type": "Code"
          },
          {
            "end": 233,
            "start": 216,
            "type": "Code"
          },
          {
            "end": 146,
            "href": "https://kotlinlang.org/docs/reference/java-to-kotlin-interop.html#variant-generics",
            "start": 132,
            "type": "Link"
          }
        ],
        "text": "Kotlin compiles generics with wildcards to make Kotlin APIs work with Java. These are generated when a type appears as a parameter (more info here) or as fields. For example, a Kotlin List\\u003cFoo\\u003e parameter shows up as List\\u003c? super Foo\\u003e in Java.",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 116,
            "start": 95,
            "type": "Code"
          },
          {
            "end": 75,
            "href": "https://en.wikipedia.org/wiki/Class_invariant",
            "start": 66,
            "type": "Link"
          },
          {
            "end": 116,
            "href": "https://kotlinlang.org/api/latest/jvm/stdlib/kotlin.jvm/-jvm-suppress-wildcards/index.html",
            "start": 96,
            "type": "Link"
          }
        ],
        "text": "This causes problems with Dagger because it expects an exact (aka invariant) type match. Using @JvmSuppressWildcards will ensure that Dagger sees the type without wildcards.",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 86,
            "href": "https://dagger.dev/multibindings.html",
            "start": 57,
            "type": "Link"
          }
        ],
        "text": "This is a common issue when you inject collections using Dagger’s multibinding feature, for example:",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 93,
            "start": 72,
            "type": "Bold"
          }
        ],
        "text": "class MyVMFactory @Inject constructor(\\n  private val vmMap: Map\\u003cString, @JvmSuppressWildcards Provider\\u003cViewModel\\u003e\\u003e\\n) { \\n    ... \\n}",
        "type": "CodeBlock"
      },
      {
        "markups": [],
        "text": "Inline method bodies",
        "type": "Header"
      },
      {
        "markups": [
          {
            "end": 60,
            "start": 51,
            "type": "Code"
          }
        ],
        "text": "Dagger determines the types that are configured by @Provides methods by inspecting the return type. Specifying the return type in Kotlin functions is optional and even the IDE sometimes encourages you to refactor your code to have inline method bodies that hide the return type declaration.",
        "type": "Text"
      },
      {
        "markups": [],
        "text": "This can lead to bugs if the inferred type is different from the one you meant. Let’s see some examples:",
        "type": "Text"
      },
      {
        "markups": [],
        "text": "If you want to add a specific type to the graph, inlining works as expected. See the different ways to do the same in Kotlin:",
        "type": "Text"
      },
      {
        "markups": [],
        "text": "If you want to provide an implementation of an interface, then you must explicitly specify the return type. Not doing it can lead to problems and bugs:",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 162,
            "start": 155,
            "type": "Code"
          },
          {
            "end": 246,
            "start": 225,
            "type": "Code"
          }
        ],
        "text": "Dagger mostly works with Kotlin out of the box. However, you have to watch out for a few things just to make sure you’re doing what you really mean to do: @field: for qualifiers on field attributes, inline method bodies, and @JvmSuppressWildcards when injecting collections.",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 194,
            "start": 185,
            "type": "Code"
          }
        ],
        "text":"Dagger optimizations come with no cost, add them and follow best practices to improve yourbuild time: enabling incremental annotation processing, disabling formatting and using static @Provides methods in your Dagger modules.",
        "type": "Text"
      }
    ],
    "publication": {
      "logoUrl": "https://cdn-images-1.medium.com/max/258/1*u7oZc2_5mrkcFaxkXEyfYA@2x.png",
      "name": "Android Developers"
    },
    "subtitle": "Use Dagger in Kotlin! This article includes best practices to optimize your build time and gotchas you might encounter.",
    "title": "Dagger in Kotlin: Gotchas and Optimizations",
    "url": "https://medium.com/androiddevelopers/dagger-in-kotlin-gotchas-and-optimizations-7446d8dfd7dc"
  },
  {
    "id": "post8",
    "imageId": 2131165296,
    "imageThumbId": 2131165297,
    "metadata": {
      "author": {
        "name": "Florina Muntenescu",
        "url": "https://medium.com/@florina.muntenescu"
      },
      "date": "July 09",
      "readTimeMinutes": 1
    },
    "paragraphs": [
      {
        "markups": [
          {
            "end": 172,
            "href": "https://codelabs.developers.google.com/codelabs/java-to-kotlin/#0",
            "start": 151,
            "type": "Link"
          },
          {
            "end": 216,
            "href": "https://clmirror.storage.googleapis.com/codelabs/java-to-kotlin-zh/index.html#0",
            "start": 209,
            "type": "Link"
          },
          {
            "end": 246,
            "href": "https://codelabs.developers.google.com/codelabs/java-to-kotlin-pt-br/#0",
            "start": 226,
            "type": "Link"
          }
        ],
        "text": "Learn how to get started converting Java Programming Language code to Kotlin, making it more idiomatic and avoid common pitfalls, by following our new Refactoring to Kotlin codelab, available in English 🇬🇧, Chinese 🇨🇳 and Brazilian Portuguese 🇧🇷.",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 124,
            "href": "https://www.jetbrains.com/help/idea/converting-a-java-file-to-kotlin-file.html",
            "start": 105,
            "type": "Link"
          }
        ],
        "text": "When you first get started writing Kotlin code, you tend to follow Java Programming Language idioms. The automatic converter, part of both Android Studio and Intellij IDEA, can do a pretty good job of automatically refactoring your code, but sometimes, it needs a little help. This is where our new Refactoring to Kotlin codelab comes in.",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 30,
            "start": 26,
            "type": "Code"
          },
          {
            "end": 47,
            "start": 37,
            "type": "Code"
          }
        ],
        "text": "We’ll take two classes (a User and a Repository) in Java Programming Language and convert them to Kotlin, check out what the automatic converter did and why. Then we go to the next level — make it idiomatic, teaching best practices and useful tips along the way.",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 251,
            "start": 245,
            "type": "Code"
          },
          {
            "end": 365,
            "start": 359,
            "type": "Code"
          },
          {
            "end": 25,
            "href": "https://codelabs.developers.google.com/codelabs/java-to-kotlin/#0",
            "start": 4,
            "type": "Link"
          }
        ],
        "text": "The Refactoring to Kotlin codelab starts with basic topics — understand how nullability is declared in Kotlin, what types of equality are defined or how to best handle classes whose role is just to hold data. We then continue with how to handle static fields and functions in Kotlin and how to apply the Singleton pattern, with the help of one handy keyword: object. We’ll see how Kotlin helps us model our classes better, how it differentiates between a property of a class and an action the class can do. Finally, we’ll learn how to execute code only in the context of a specific object with the scope functions.",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 42,
            "href": "https://codelabs.developers.google.com/codelabs/java-to-kotlin/#0",
            "start": 21,
            "type": "Link"
          }
        ],
        "text": "Thanks to Walmyr Carvalho and Nelson Glauber for translating the codelab in Brazilian Portuguese!",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 96,
            "href": "https://codelabs.developers.google.com/codelabs/java-to-kotlin-pt-br/#0",
            "start": 76,
            "type": "Link"
          }
        ],
        "text": "",
        "type": "Text"
      }
    ],
    "publication": {
      "logoUrl": "https://cdn-images-1.medium.com/max/258/1*u7oZc2_5mrkcFaxkXEyfYA@2x.png",
      "name": "Android Developers"
    },
    "subtitle": "Learn how to get started converting Java Programming Language code to Kotlin, making it more idiomatic and avoid common pitfalls, by…",
    "title": "From Java Programming Language to Kotlin — the idiomatic way",
    "url":"https://medium.com/androiddevelopers/from-java-programming-language-to-kotlin-the-idiomatic-way-ac552dcc1741"
  },
  {
    "id": "post9",
    "imageId": 2131165298,
    "imageThumbId": 2131165299,
    "metadata": {
      "author": {
        "name": "Jose Alcérreca",
        "url": "https://medium.com/@JoseAlcerreca"
      },
      "date": "April 02",
      "readTimeMinutes": 1
    },
    "paragraphs": [
      {
        "markups": [],
        "text": "TL;DR: Expose resource IDs from ViewModels to avoid showing obsolete data.",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 197,
            "start": 183,
            "type": "Bold"
          }
        ],
        "text": "In a ViewModel, if you’re exposing data coming from resources (strings, drawables, colors…), you have to take into account that ViewModel objects ignore configuration changes such as locale changes. When the user changes their locale, activities are recreated but the ViewModel objects are not.",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 16,
            "start": 0,
            "type": "Code"
          },
          {
            "end": 43,
            "start": 34,
            "type": "Code"
          },
          {
            "end": 303,
            "start": 209,
            "type": "Bold"
          }
        ],
        "text": "AndroidViewModel is a subclass of ViewModel that is aware of the Application context. However, having access to a context can be dangerous if you’re not observing or reacting to the lifecycle of that context. The recommended practice is to avoid dealing with objects that have a lifecycle in ViewModels.",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 103,
            "href": "https://issuetracker.google.com/issues/111961971",
            "start": 61,
            "type": "Link"
          },
          {
            "end": 104,
            "start": 61,
            "type": "Italic"
          }
        ],
        "text": "Let’s look at an example based on this issue in the tracker: Updating ViewModel on system locale change.",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 133,
            "start": 73,
            "type": "Bold"
          }
        ],
        "text": "The problem is that the string is resolved in the constructor only once. If there’s a locale change, the ViewModel won’t be recreated. This will result in our app showing obsolete data and therefore being only partially localized.",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 9,
            "href": "https://twitter.com/ZelenetS",
            "start": 3,
            "type": "Link"
          },
          {
            "end": 36,
            "href": "https://issuetracker.google.com/issues/111961971#comment2",
            "start": 28,
            "type": "Link"
          },
          {
            "end": 150,
            "start": 82,
            "type": "Bold"
          }
        ],
        "text": "As Sergey points out in the comments to the issue, the recommended approach is to expose the ID of the resource you want to load and do so in the view. As the view (activity, fragment, etc.) is lifecycle-aware it will be recreated after a configuration change so the resource will be reloaded correctly.",
        "type": "Text"
      },
      {
        "markups": [],
        "text": "Even if you don’t plan to localize your app, it makes testing much easier and cleans up your ViewModel objects so there’s no reason not to future-proof.",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 70,
            "href": "https://github.com/googlesamples/android-architecture/pull/631",
            "start": 66,
            "type": "Link"
          },
          {
            "end": 81,
            "href": "https://github.com/googlesamples/android-architecture/pull/635",
            "start": 75,
            "type": "Link"
          },
          {
            "end": 151,
            "href": "https://github.com/googlesamples/android-architecture/pull/635/files#diff-7eb5d85ec3ea4e05ecddb7dc8ae20aa1R62",
            "start": 128,
            "type": "Link"
          }
        ],
        "text": "We fixed this issue in the android-architecture repository in the Java and Kotlin branches and we offloaded resource loading to the Data Binding layout.",
        "type": "Text"
      }
    ],
    "publication": {
      "logoUrl": "https://cdn-images-1.medium.com/max/258/1*u7oZc2_5mrkcFaxkXEyfYA@2x.png",
      "name": "Android Developers"
    },
    "subtitle": "TL;DR: Expose resource IDs from ViewModels to avoid showing obsolete data.",
    "title": "Locale changes and the AndroidViewModel antipattern",
    "url": "https://medium.com/androiddevelopers/locale-changes-and-the-androidviewmodel-antipattern-84eb677660d9"
  },
  {
    "id": "post10",
    "imageId": 2131165300,
    "imageThumbId": 2131165301,
    "metadata": {
      "author": {
        "name": "Florina Muntenescu",
        "url": "https://medium.com/@florina.muntenescu"
      },
      "date": "July 24",
      "readTimeMinutes": 4
    },
    "paragraphs": [
      {
        "markups": [
          {
            "end": 220,
            "start": 210,
            "type": "Code"
          },
          {
            "end": 249,
            "start": 241,
            "type": "Code"
          },
          {
            "end": 221,
            "href": "https://kotlinlang.org/api/latest/jvm/stdlib/kotlin.collections/index.html",
            "start": 210,
            "type": "Link"
          },
          {
            "end": 250,
            "href": "https://kotlinlang.org/api/latest/jvm/stdlib/kotlin.sequences/index.html",
            "start": 241,
            "type": "Link"
          },
          {
            "end": 134,
            "start": 130,
            "type":"Bold"
          },
          {
            "end": 202,
            "start": 195,
            "type": "Bold"
          },
          {
            "end": 233,
            "start": 227,
            "type": "Bold"
          },
          {
            "end": 134,
            "start": 130,
            "type": "Italic"
          }
        ],
        "text": "Working with collections is a common task and the Kotlin Standard Library offers many great utility functions. It also offers two ways of working with collections based on how they’re evaluated: eagerly — with Collections, and lazily — with Sequences. Continue reading to find out what’s the difference between the two, which one you should use and when, and what the performance implications of each are.",
        "type": "Text"
      },
      {
        "markups": [],
        "text": "Collections vs sequences",
        "type": "Header"
      },
      {
        "markups": [
          {
            "end": 61,
            "start": 57,
            "type": "Italic"
          }
        ],
        "text": "The difference between eager and lazy evaluation lies in when each transformation on the collection is performed.",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 232,
            "start": 229,
            "type": "Code"
          },
          {
            "end": 279,
            "start": 273,
            "type": "Code"
          },
          {
            "end": 318,
            "start": 309,
            "type": "Code"
          },
          {
            "end": 199,
            "href": "https://kotlinlang.org/docs/reference/inline-functions.html",
            "start": 183,
            "type": "Link"
          },
          {
            "end": 232,
            "href": "https://github.com/JetBrains/kotlin/blob/master/libraries/stdlib/common/src/generated/_Collections.kt#L1312",
            "start": 229,
            "type": "Link"
          },
          {
            "end": 12,
            "start": 0,
            "type": "Bold"
          },
          {
            "end": 23,
            "start": 16,
            "type": "Italic"
          }
        ],
        "text": "Collections are eagerly evaluated — each operation is performed when it’s called and the result of the operation is stored in a new collection. The transformations on collections are inline functions. For example, looking at how map is implemented, we can see that it’s an inline function, that creates a new ArrayList:",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 13,
            "start": 7,
            "type": "Bold"
          },
          {
            "end": 97,
            "start": 88,
            "type": "Bold"
          }
        ],
        "text": "public inline fun \\u003cT, R\\u003e Iterable\\u003cT\\u003e.map(transform: (T) -\\u003e R): List\\u003cR\\u003e {\\n  return mapTo(ArrayList\\u003cR\\u003e(collectionSizeOrDefault(10)), transform)\\n}",
        "type": "CodeBlock"
      },
      {
        "markups": [
          {
            "end": 3600,
            "start": 357,
            "type": "Code"
          },
          {
            "end": 370,
            "start": 362,
            "type": "Code"
          },
          {
            "end": 379,
            "start": 372,
            "type": "Code"
          },
          {
            "end": 448,
            "start": 443,
            "type": "Code"
          },
          {
            "end": 456,
            "start": 450,
            "type": "Code"
          },
          {
            "end": 463,
            "start": 458,
            "type": "Code"
          },
          {
            "end": 9,
            "start": 0,
            "type": "Bold"
          },
          {
            "end": 79,
            "start": 67,
            "type": "Bold"
          },
          {
            "end": 92,
            "start": 84,
            "type": "Bold"
          },
          {
            "end": 269,
            "start": 254,
            "type": "Bold"
          },
          {
            "end": 20,
            "start": 14,
            "type": "Italic"
          }
        ],
        "text": "Sequences are lazily evaluated. They have two types of operations: intermediate and terminal. Intermediate operations are not performed on the spot; they’re just stored. Only when a terminal operation is called, the intermediate operations are triggered on each element in a row and finally, the terminal operation is applied. Intermediate operations (like map, distinct, groupBy etc) return another sequence whereas terminal operations (like first, toList, count etc) don’t.",
        "type": "Text"
      },
      {
        "markups": [],
        "text": "Sequences don’t hold a reference to the items of the collection. They’re created based on the iterator of the original collection and keep a reference to all the intermediate operations that need to be performed.",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 225,
            "start": 222,
            "type": "Code"
          },
          {
            "end": 320,
            "start": 312,
            "type": "Code"
          },
          {
            "end": 225,
            "href": "https://github.com/JetBrains/kotlin/blob/master/libraries/stdlib/common/src/generated/_Sequences.kt#L860",
            "start": 222,
            "type": "Link"
          }
        ],
        "text": "Unlike transformations on collections, intermediate transformations on sequences are not inline functions — inline functions cannot be stored and sequences need to store them. Looking at how an intermediate operation like map is implemented, we can see that the transform function is kept in a new instance of a Sequence:",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 105,
            "start": 85,
            "type": "Bold"
          }
        ],
        "text": "public fun \\u003cT, R\\u003e Sequence\\u003cT\\u003e.map(transform: (T) -\\u003e R): Sequence\\u003cR\\u003e{      \\n   return TransformingSequence(this, transform)\\n}",
        "type": "CodeBlock"
      },
      {
        "markups": [
          {
            "end": 32,
            "start": 27,
            "type": "Code"
          },
          {
            "end": 32,
            "href":"https://github.com/JetBrains/kotlin/blob/master/libraries/stdlib/common/src/generated/_Sequences.kt#L117",
            "start": 27,
            "type": "Link"
          }
        ],
        "text": "A terminal operation, like first, iterates through the elements of the sequence until the predicate condition is matched.",
        "type": "Text"
      },
      {
        "markups": [],
        "text": "public inline fun \\u003cT\\u003e Sequence\\u003cT\\u003e.first(predicate: (T) -\\u003e Boolean): T {\\n   for (element in this) if (predicate(element)) return element\\n   throw NoSuchElementException(“Sequence contains no element matching the predicate.”)\\n}",
        "type": "CodeBlock"
      },
      {
        "markups": [
          {
            "end": 54,
            "start": 34,
            "type": "Code"
          },
          {
            "end": 71,
            "start": 68,
            "type": "Code"
          }
        ],
        "text": "If we look at how a sequence like TransformingSequence (used in the map above) is implemented, we’ll see that when next is called on the sequence iterator, the transformation stored is also applied.",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 120,
            "start": 109,
            "type": "Bold"
          }
        ],
        "text": "internal class TransformingIndexedSequence\\u003cT, R\\u003e \\nconstructor(private val sequence: Sequence\\u003cT\\u003e, private val transformer: (Int, T) -\\u003e R) : Sequence\\u003cR\\u003e {",
        "type": "CodeBlock"
      },
      {
        "markups": [
          {
            "end": 89,
            "start": 83,
            "type": "Bold"
          },
          {
            "end": 118,
            "start": 107,
            "type": "Bold"
          }
        ],
        "text": "override fun iterator(): Iterator\\u003cR\\u003e \\u003d object : Iterator\\u003cR\\u003e {\\n   …\\n   override fun next(): R {\\n     return transformer(checkIndexOverflow(index++), iterator.next())\\n   }\\n   …\\n}",
        "type": "CodeBlock"
      },
      {
        "markups": [
          {
            "end": 149,
            "start": 145,
            "type": "Code"
          },
          {
            "end": 157,
            "start": 151,
            "type": "Code"
          },
          {
            "end": 166,
            "start": 159,
            "type": "Code"
          },
          {
            "end": 207,
            "href": "https://kotlinlang.org/api/latest/jvm/stdlib/kotlin.collections/#functions",
            "start": 193,
            "type": "Link"
          }
        ],
        "text": "Independent on whether you’re using collections or sequences, the Kotlin Standard Library offers quite a wide range of operations for both, like find, filter, groupBy and others. Make sure you check them out, before implementing your own version of these.",
        "type": "Text"
      },
      {
        "markups": [],
        "text": "Collections and sequences",
        "type": "Header"
      },
      {
        "markups": [],
        "text": "Let’s say that we have a list of objects of different shapes. We want to make the shapes yellow and then take the first square shape.",
        "type": "Text"
      },
      {
        "markups": [],
        "text": "Let’s see how and when each operation is applied for collections and when for sequences",
        "type": "Text"
      },
      {
        "markups": [],
        "text": "Collections",
        "type": "Subhead"
      },
      {
        "markups": [
          {
            "end": 3,
            "start": 0,
            "type": "Code"
          }
        ],
        "text": "map is called — a new ArrayList is created. We iterate through all items of the initial collection, transform it by copying the original object and changing the color, then add it to the new list.",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 5,
            "start": 0,
            "type": "Code"
          }
        ],
        "text": "first is called — we iterate through each item until the first square is found",
        "type": "Text"
      },
      {
        "markups": [],
        "text": "Sequences",
        "type": "Subhead"
      },
      {
        "markups": [
          {
            "end": 10,
            "start": 0,
            "type": "Code"
          }
        ],
        "text": "asSequence — a sequence is created based on the Iterator of the original collection",
        "type": "Bullet"
      },
      {
        "markups": [
          {
            "end": 3,
            "start": 0,
            "type": "Code"
          },
          {
            "end": 133,
            "start": 130,
            "type": "Bold"
          }
        ],
        "text": "map is called — the transformation is added to the list of operations needed to be performed by the sequence but the operation is NOT performed",
        "type": "Bullet"
      },
      {
        "markups": [
          {
            "end": 5,
            "start": 0,
            "type": "Code"
          }
        ],
        "text": "first is called — this is a terminal operation, so, all the intermediate operations are triggered, on each element of the collection. We iterate through the initial collection applying map and then first on each of them. Since the condition from first is satisfied by the 2nd element, then we no longer apply the map on the rest of the collection.",
        "type": "Bullet"
      },
      {
        "markups": [],
        "text": "When working with sequences no intermediate collection is created and since items are evaluated one by one, map is only performed on some of the inputs.",
        "type": "Text"
      },
      {
        "markups": [],
        "text": "Performance",
        "type": "Header"
      },
      {
        "markups": [],
        "text": "Order of transformations","type": "Subhead"
      },
      {
        "markups": [
          {
            "end": 127,
            "start": 122,
            "type": "Code"
          },
          {
            "end": 160,
            "start": 157,
            "type": "Code"
          },
          {
            "end": 200,
            "start": 197,
            "type": "Code"
          }
        ],
        "text": "Independent of whether you’re using collections or sequences, the order of transformations matters. In the example above, first doesn’t need to happen after map since it’s not a consequence of the map transformation. If we reverse the order of our business logic and call first on the collection and then transform the result, then we only create one new object — the yellow square. When using sequences — we avoid creating 2 new objects, when using collections, we avoid creating an entire new list.",
        "type": "Text"
      },
      {
        "markups": [],
        "text": "Because terminal operations can finish processing early, and intermediate operations are evaluated lazily, sequences can, in some cases, help you avoid doing unnecessary work compared to collections. Make sure you always check the order of the transformations and the dependencies between them!",
        "type": "Text"
      },
      {
        "markups": [],
        "text": "Inlining and large data sets consequences",
        "type": "Subhead"
      },
      {
        "markups": [
          {
            "end": 210,
            "start": 202,
            "type": "Code"
          }
        ],
        "text": "Collection operations use inline functions, so the bytecode of the operation, together with the bytecode of the lambda passed to it will be inlined. Sequences don’t use inline functions, therefore, new Function objects are created for each operation.",
        "type": "Text"
      },
      {
        "markups": [],
        "text": "On the other hand, collections create a new list for every transformation while sequences just keep a reference to the transformation function.",
        "type": "Text"
      },
      {
        "markups": [
          {
            "end": 35,
            "start": 18,
            "type": "Bold"
          },
          {
            "end": 130,
            "start": 119,
            "type": "Bold"
          },
          {
            "end": 179,
            "start": 168,
            "type": "Bold"
          },
          {
            "end": 267,
            "start": 258,
            "type": "Bold"
          }
        ],
        "text": "When working with small collections, with 1–2 operators, these differences don’t have big implications so working with collections should be ok. But, when working with large lists the intermediate collection creation can become expensive; in such cases, use sequences.",
        "type": "Text"
      },
      {
        "markups": [],
        "text": "Unfortunately, I’m not aware of any benchmarking study done that would help us get a better understanding on how the performance of collections vs sequences is affected with different sizes of collections or operation chains.",
        "type": "Text"
      },
      {
        "markups": [],
        "text": "Collections eagerly evaluate your data while sequences do so lazily. Depending on the size of your data, pick the one that fits best: collections — for small lists or sequences — for larger ones, and pay attention to the order of the transformations.",
        "type": "Text"
      }
    ],
    "publication": {
      "logoUrl": "https://cdn-images-1.medium.com/max/258/1*u7oZc2_5mrkcFaxkXEyfYA@2x.png",
      "name": "Android Developers"
    },
    "subtitle": "Working with collections is a common task and the Kotlin Standard Library offers many great utility functions. It also offers two ways of…",
    "title": "Collections and sequences in Kotlin",
    "url": "https://medium.com/androiddevelopers/collections-and-sequences-in-kotlin-55db18283aca"
  }
]
''';
