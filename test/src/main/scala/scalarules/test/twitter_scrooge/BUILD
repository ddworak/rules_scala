load("//scala:scala.bzl", "scala_binary", "scala_library")
load("//twitter_scrooge:twitter_scrooge.bzl", "scrooge_scala_library")

scrooge_scala_library(
    name = "scrooge1",
    visibility = ["//visibility:public"],
    deps = [
        ":scrooge2_a",
        ":scrooge2_b",
        ":scrooge3",
        "//test/src/main/scala/scalarules/test/twitter_scrooge/thrift",
    ],
)

scrooge_scala_library(
    name = "scrooge2_a",
    visibility = ["//visibility:public"],
    deps = [
        ":scrooge3",
        "//test/src/main/scala/scalarules/test/twitter_scrooge/thrift/thrift2:thrift2_a",
    ],
)

scrooge_scala_library(
    name = "scrooge2_b",
    visibility = ["//visibility:public"],
    deps = [
        ":scrooge3",
        "//test/src/main/scala/scalarules/test/twitter_scrooge/thrift/thrift2:thrift2_b",
    ],
)

scrooge_scala_library(
    name = "scrooge3",
    visibility = ["//visibility:public"],
    deps = ["//test/src/main/scala/scalarules/test/twitter_scrooge/thrift/thrift2/thrift3"],
)

scrooge_scala_library(
    name = "scrooge2",
    visibility = ["//visibility:public"],
    deps = [
        ":scrooge3",
        "//test/src/main/scala/scalarules/test/twitter_scrooge/thrift/thrift2:thrift2_a",
        "//test/src/main/scala/scalarules/test/twitter_scrooge/thrift/thrift2:thrift2_b",
    ],
)

scrooge_scala_library(
    name = "scrooge4",
    visibility = ["//visibility:public"],
    deps = [
        ":scrooge2",
        "//test/src/main/scala/scalarules/test/twitter_scrooge/thrift/thrift2/thrift4",
    ],
)

scrooge_scala_library(
    name = "scrooge4a",
    visibility = ["//visibility:public"],
    deps = [
        ":scrooge4",
        "//test/src/main/scala/scalarules/test/twitter_scrooge/thrift/thrift2/thrift4:thrift4a",
    ],
)

scrooge_scala_library(
    name = "scroogebarejar1",
    visibility = ["//visibility:public"],
    deps = [
        "//test/src/main/scala/scalarules/test/twitter_scrooge/thrift/bare_jar_thrifts/bare_jar_1",
    ],
)

scrooge_scala_library(
    name = "scroogebarejar2",
    visibility = ["//visibility:public"],
    deps = [
        "//test/src/main/scala/scalarules/test/twitter_scrooge/thrift/bare_jar_thrifts/bare_jar_2",
    ],
)

scrooge_scala_library(
    name = "bare_thrift_scrooge",
    visibility = ["//visibility:public"],
    deps = [
        ":scroogebarejar1",
        ":scroogebarejar2",
        "//test/src/main/scala/scalarules/test/twitter_scrooge/thrift/bare_jar_thrifts",
    ],
)

scrooge_scala_library(
    name = "thrift_with_remote_jar",
    remote_jars = [
        "//test/src/main/scala/scalarules/test/twitter_scrooge/thrift/bare_jar_thrifts:barejar_java_import",
    ],
    visibility = ["//visibility:public"],
    deps = [
        "//test/src/main/scala/scalarules/test/twitter_scrooge/thrift/bare_jar_thrifts/bare_jar_2",
    ],
)

scala_library(
    name = "justscrooge1",
    srcs = ["JustScrooge1.scala"],
    exports = [":scrooge1"],
    deps = [":scrooge1"],
)

scala_library(
    name = "justscrooge2a",
    srcs = ["JustScrooge2a.scala"],
    deps = [":scrooge2_a"],
)

scala_library(
    name = "justscrooge2b",
    srcs = ["JustScrooge2b.scala"],
    deps = [":scrooge2_b"],
)

scala_library(
    name = "justscrooge3",
    srcs = ["JustScrooge3.scala"],
    exports = [":scrooge3"],
    deps = [":scrooge3"],
)

scala_library(
    name = "scrooge2_both",
    srcs = ["Scrooge2.scala"],
    deps = [":scrooge2"],
)

scala_library(
    name = "mixed",
    srcs = ["Mixed.scala"],
    deps = [
        ":justscrooge1",
        ":justscrooge2a",
        ":justscrooge2b",
        ":justscrooge3",
    ],
)

scala_library(
    name = "twodeep",
    srcs = ["Twodeep.scala"],
    deps = [":justscrooge3"],
)

scala_binary(
    name = "twodeep_binary",
    main_class = "scalarules.test.twitter_scrooge.Twodeep",
    deps = [":twodeep"],
)

scala_binary(
    name = "justscrooge2b_binary",
    main_class = "scalarules.test.twitter_scrooge.JustScrooge2b",
    deps = [":justscrooge2b"],
)

scala_library(
    name = "allscrooges",
    exports = [
        ":scrooge1",
        ":scrooge2_a",
        ":scrooge2_b",
        ":scrooge3",
    ],
)

scala_binary(
    name = "justscrooges",
    srcs = ["JustScrooge1.scala"],
    main_class = "scalarules.test.twitter_scrooge.JustScrooge1",
    deps = [":allscrooges"],
)

scala_library(
    name = "barethriftslib",
    srcs = ["BareThrifts.scala"],
    deps = [":bare_thrift_scrooge"],
)

scala_binary(
    name = "barethrifts",
    main_class = "scalarules.test.twitter_scrooge.BareThrifts",
    deps = [":bare_thrift_scrooge"],
)