load(
    "//scala:scala_cross_version.bzl",
    _default_maven_server_urls = "default_maven_server_urls",
)
load(
    "//scala_proto/private:scala_proto_default_repositories.bzl",
    "scala_proto_default_repositories",
)
load(
    "//scala_proto/private:scalapb_aspect.bzl",
    "ScalaPBAspectInfo",
    "ScalaPBInfo",
    "merge_scalapb_aspect_info",
    "scalapb_aspect",
)

def scala_proto_repositories(
        maven_servers = _default_maven_server_urls()):
    return scala_proto_default_repositories(maven_servers)

def _scala_proto_library_impl(ctx):
    aspect_info = merge_scalapb_aspect_info(
        [dep[ScalaPBAspectInfo] for dep in ctx.attr.deps],
    )
    all_java = aspect_info.java_info

    return [
        all_java,
        ScalaPBInfo(aspect_info = aspect_info),
        DefaultInfo(files = aspect_info.output_files),
    ]

scala_proto_library = rule(
    implementation = _scala_proto_library_impl,
    attrs = {
        "deps": attr.label_list(aspects = [scalapb_aspect]),
    },
    provides = [DefaultInfo, ScalaPBInfo, JavaInfo],
)

def scalapb_proto_library(**kwargs):
    scala_proto_library(**kwargs)
