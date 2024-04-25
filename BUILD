load("@bazel_skylib//rules:build_test.bzl", "build_test")
load("@llvm-project//mlir:tblgen.bzl", "gentbl_cc_library", "gentbl_filegroup", "td_library")

package(
    # copybara:uncomment default_applicable_licenses = ["//third_party/tensorflow:license"],
    default_visibility = internal_visibility(["//learning/brain/mlir:mhlo_friends"]),
    licenses = ["notice"],
)

exports_files([
    "mhlo/IR/hlo_ops.td",
    "lhlo/IR/lhlo_ops.td",
])

# Python extension sources.
exports_files(["bindings/python/MlirHloModule.cc"])

filegroup(
    name = "hlo_ops_td_filegroup",
    srcs = glob(["mhlo/IR/*.td"]),
)

td_library(
    name = "hlo_ops_td_files",
    srcs = glob(["mhlo/IR/*.td"]),
    includes = ["."],
    deps = [
        "//stablehlo:base_td_files",
        "//stablehlo:chlo_ops_td_files",
        "@llvm-project//mlir:BuiltinDialectTdFiles",
        "@llvm-project//mlir:ControlFlowInterfacesTdFiles",
        "@llvm-project//mlir:CopyOpInterfaceTdFiles",
        "@llvm-project//mlir:InferTypeOpInterfaceTdFiles",
        "@llvm-project//mlir:LoopLikeInterfaceTdFiles",
        "@llvm-project//mlir:MemRefOpsTdFiles",
        "@llvm-project//mlir:OpBaseTdFiles",
        "@llvm-project//mlir:QuantizationOpsTdFiles",
        "@llvm-project//mlir:ShapeOpsTdFiles",
        "@llvm-project//mlir:SideEffectInterfacesTdFiles",
        "@llvm-project//mlir:ViewLikeInterfaceTdFiles",
    ],
)

gentbl_cc_library(
    name = "mhlo_pass_inc_gen",
    strip_include_prefix = ".",
    tbl_outs = [
        (
            [
                "-gen-pass-decls",
                "-name=AllMhlo",
            ],
            "mhlo/transforms/mhlo_passes.h.inc",
        ),
    ],
    tblgen = "@llvm-project//mlir:mlir-tblgen",
    td_file = "mhlo/transforms/mhlo_passes.td",
    deps = ["@llvm-project//mlir:PassBaseTdFiles"],
)

gentbl_cc_library(
    name = "lmhlo_pass_inc_gen",
    strip_include_prefix = ".",
    tbl_outs = [
        (
            [
                "-gen-pass-decls",
                "-name=AllLmhlo",
            ],
            "lhlo/transforms/lmhlo_passes.h.inc",
        ),
    ],
    tblgen = "@llvm-project//mlir:mlir-tblgen",
    td_file = "lhlo/transforms/lmhlo_passes.td",
    deps = ["@llvm-project//mlir:PassBaseTdFiles"],
)

gentbl_cc_library(
    name = "hlo_ops_inc_gen",
    strip_include_prefix = ".",
    tbl_outs = [
        (
            ["-gen-op-decls"],
            "mhlo/IR/hlo_ops.h.inc",
        ),
        (
            ["-gen-op-defs"],
            "mhlo/IR/hlo_ops.cc.inc",
        ),
    ],
    tblgen = "@llvm-project//mlir:mlir-tblgen",
    td_file = "mhlo/IR/hlo_ops.td",
    deps = [":hlo_ops_td_files"],
)

gentbl_cc_library(
    name = "hlo_ops_attrs_inc_gen",
    strip_include_prefix = ".",
    tbl_outs = [
        (
            ["-gen-attrdef-decls"],
            "mhlo/IR/hlo_ops_attrs.h.inc",
        ),
        (
            ["-gen-attrdef-defs"],
            "mhlo/IR/hlo_ops_attrs.cc.inc",
        ),
    ],
    tblgen = "@llvm-project//mlir:mlir-tblgen",
    td_file = "mhlo/IR/hlo_ops.td",
    deps = [":hlo_ops_td_files"],
)

gentbl_cc_library(
    name = "hlo_ops_enums_inc_gen",
    strip_include_prefix = ".",
    tbl_outs = [
        (
            ["-gen-enum-decls"],
            "mhlo/IR/hlo_ops_enums.h.inc",
        ),
        (
            ["-gen-enum-defs"],
            "mhlo/IR/hlo_ops_enums.cc.inc",
        ),
    ],
    tblgen = "@llvm-project//mlir:mlir-tblgen",
    td_file = "mhlo/IR/hlo_ops.td",
    deps = [":hlo_ops_td_files"],
)

gentbl_cc_library(
    name = "hlo_ops_typedefs_inc_gen",
    strip_include_prefix = ".",
    tbl_outs = [
        (
            [
                "-gen-typedef-decls",
                "--typedefs-dialect=mhlo",
            ],
            "mhlo/IR/hlo_ops_typedefs.h.inc",
        ),
        (
            [
                "-gen-typedef-defs",
                "--typedefs-dialect=mhlo",
            ],
            "mhlo/IR/hlo_ops_typedefs.cc.inc",
        ),
    ],
    tblgen = "@llvm-project//mlir:mlir-tblgen",
    td_file = "mhlo/IR/hlo_ops.td",
    deps = [":hlo_ops_td_files"],
)

gentbl_cc_library(
    name = "hlo_ops_pattern_inc_gen",
    strip_include_prefix = "mhlo/IR/",
    tbl_outs = [
        (
            ["-gen-rewriters"],
            "mhlo/IR/hlo_patterns.cc.inc",
        ),
    ],
    tblgen = "@llvm-project//mlir:mlir-tblgen",
    td_file = "mhlo/IR/hlo_patterns.td",
    deps = [
        ":hlo_ops_td_files",
        "@llvm-project//mlir:FuncTdFiles",
        "@llvm-project//mlir:TensorOpsTdFiles",
    ],
)

gentbl_cc_library(
    name = "lhlo_ops_structs_inc_gen",
    strip_include_prefix = ".",
    tbl_outs = [
        (
            ["-gen-attrdef-decls"],
            "lhlo/IR/lhlo_ops_structs.h.inc",
        ),
        (
            ["-gen-attrdef-defs"],
            "lhlo/IR/lhlo_ops_structs.cc.inc",
        ),
    ],
    tblgen = "@llvm-project//mlir:mlir-tblgen",
    td_file = "lhlo/IR/lhlo_ops_structs.td",
    deps = [":lhlo_ops_td_files"],
)

gentbl_cc_library(
    name = "lhlo_ops_inc_gen",
    strip_include_prefix = ".",
    tbl_outs = [
        (
            ["-gen-op-decls"],
            "lhlo/IR/lhlo_ops.h.inc",
        ),
        (
            ["-gen-op-defs"],
            "lhlo/IR/lhlo_ops.cc.inc",
        ),
    ],
    tblgen = "@llvm-project//mlir:mlir-tblgen",
    td_file = "lhlo/IR/lhlo_ops.td",
    deps = [":lhlo_ops_td_files"],
)

gentbl_filegroup(
    name = "hlo_ops_doc_gen",
    tbl_outs = [
        (
            [
                "-gen-dialect-doc",
                "-dialect=mhlo",
            ],
            "g3doc/hlo_ops.md",
        ),
    ],
    tblgen = "@llvm-project//mlir:mlir-tblgen",
    td_file = "mhlo/IR/hlo_ops.td",
    deps = [":hlo_ops_td_files"],
)

gentbl_filegroup(
    name = "lhlo_ops_doc_gen",
    tbl_outs = [
        (
            [
                "-gen-dialect-doc",
                "-dialect=lmhlo",
            ],
            "g3doc/lhlo_ops.md",
        ),
    ],
    tblgen = "@llvm-project//mlir:mlir-tblgen",
    td_file = "lhlo/IR/lhlo_ops.td",
    deps = [":lhlo_ops_td_files"],
)

cc_library(
    name = "hlo_ops_common",
    srcs = ["mhlo/IR/hlo_ops_common.cc"],
    hdrs = ["mhlo/IR/hlo_ops_common.h"],
    strip_include_prefix = ".",
    deps = [
        "@llvm-project//llvm:Support",
        "@llvm-project//mlir:IR",
        "@llvm-project//mlir:Support",
    ],
)

#TODO(aminim): revisit the naming and grouping of these rules post-move.
gentbl_cc_library(
    name = "canonicalize_inc_gen",
    strip_include_prefix = ".",
    tbl_outs = [
        (
            ["-gen-rewriters"],
            "mhlo/IR/mhlo_canonicalize.inc",
        ),
    ],
    tblgen = "@llvm-project//mlir:mlir-tblgen",
    td_file = "mhlo/IR/mhlo_canonicalize.td",
    deps = [":hlo_ops_td_files"],
)

cc_library(
    name = "deallocation_passes",
    srcs = [
        "deallocation/transforms/buffer_reuse.cc",
    ],
    hdrs = [
        "deallocation/transforms/passes.h",
    ],
    strip_include_prefix = ".",
    deps = [
        ":deallocation_passes_inc_gen",
        ":deallocation_utils",
        "@llvm-project//llvm:Support",
        "@llvm-project//mlir:Analysis",
        "@llvm-project//mlir:ArithDialect",
        "@llvm-project//mlir:BufferizationDialect",
        "@llvm-project//mlir:ControlFlowInterfaces",
        "@llvm-project//mlir:FuncDialect",
        "@llvm-project//mlir:IR",
        "@llvm-project//mlir:LLVMCommonConversion",
        "@llvm-project//mlir:LLVMDialect",
        "@llvm-project//mlir:MemRefDialect",
        "@llvm-project//mlir:Pass",
        "@llvm-project//mlir:SCFDialect",
        "@llvm-project//mlir:Support",
        "@llvm-project//mlir:TransformUtils",
        "@llvm-project//mlir:Transforms",
    ],
)

gentbl_cc_library(
    name = "deallocation_passes_inc_gen",
    strip_include_prefix = ".",
    tbl_outs = [
        (
            [
                "-gen-pass-decls",
                "-name=Deallocation",
            ],
            "deallocation/transforms/passes.h.inc",
        ),
    ],
    tblgen = "@llvm-project//mlir:mlir-tblgen",
    td_file = "deallocation/transforms/passes.td",
    deps = ["@llvm-project//mlir:PassBaseTdFiles"],
)

cc_library(
    name = "deallocation_utils",
    srcs = ["deallocation/utils/util.cc"],
    hdrs = ["deallocation/utils/util.h"],
    strip_include_prefix = ".",
    deps = [
        "@llvm-project//llvm:Support",
        "@llvm-project//mlir:ControlFlowInterfaces",
        "@llvm-project//mlir:IR",
        "@llvm-project//mlir:MemRefDialect",
        "@llvm-project//mlir:SCFDialect",
    ],
)

td_library(
    name = "lhlo_ops_td_files",
    srcs = glob(["lhlo/IR/*.td"]),
    includes = ["."],
    deps = [
        ":hlo_ops_td_files",
        "@llvm-project//mlir:ControlFlowInterfacesTdFiles",
        "@llvm-project//mlir:CopyOpInterfaceTdFiles",
        "@llvm-project//mlir:InferTypeOpInterfaceTdFiles",
        "@llvm-project//mlir:LoopLikeInterfaceTdFiles",
        "@llvm-project//mlir:MemRefOpsTdFiles",
        "@llvm-project//mlir:OpBaseTdFiles",
        "@llvm-project//mlir:ShapeOpsTdFiles",
        "@llvm-project//mlir:SideEffectInterfacesTdFiles",
        "@llvm-project//mlir:ViewLikeInterfaceTdFiles",
    ],
)

gentbl_cc_library(
    name = "lhlo_structured_interface_inc_gen",
    strip_include_prefix = ".",
    tbl_outs = [
        (
            ["-gen-op-interface-decls"],
            "lhlo/IR/lhlo_structured_interface.h.inc",
        ),
        (
            ["-gen-op-interface-defs"],
            "lhlo/IR/lhlo_structured_interface.cpp.inc",
        ),
    ],
    tblgen = "@llvm-project//mlir:mlir-tblgen",
    td_file = "lhlo/IR/lhlo_structured_interface.td",
    deps = [":lhlo_ops_td_files"],
)

cc_library(
    name = "lhlo_structured_interface",
    srcs = ["lhlo/IR/lhlo_structured_interface.cc"],
    hdrs = [
        "lhlo/IR/lhlo_structured_interface.h",
        "lhlo/IR/lhlo_structured_interface.h.inc",
    ],
    strip_include_prefix = ".",
    deps = [
        ":lhlo_structured_interface_inc_gen",
        "@llvm-project//mlir:IR",
        "@llvm-project//mlir:Support",
    ],
)

cc_library(
    name = "convert_op_folder",
    srcs = ["utils/convert_op_folder.cc"],
    hdrs = ["utils/convert_op_folder.h"],
    strip_include_prefix = ".",
    deps = [
        "@llvm-project//llvm:Support",
        "@llvm-project//mlir:IR",
        "@llvm-project//mlir:Support",
    ],
)

cc_library(
    name = "mlir_hlo",
    srcs = [
        "mhlo/IR/hlo_ops.cc",
        "mhlo/IR/hlo_ops.cc.inc",
        "mhlo/IR/hlo_ops.h.inc",
        "mhlo/IR/hlo_ops_attrs.cc.inc",
        "mhlo/IR/hlo_ops_attrs.h.inc",
        "mhlo/IR/hlo_ops_enums.cc.inc",
        "mhlo/IR/hlo_ops_enums.h.inc",
        "mhlo/IR/hlo_ops_typedefs.cc.inc",
        "mhlo/IR/hlo_ops_typedefs.h.inc",
        "mhlo/IR/mhlo_bytecode.cc",
        "utils/hlo_utils.cc",
    ],
    hdrs = [
        "mhlo/IR/hlo_ops.h",
        "mhlo/IR/mhlo_bytecode.h",
        "utils/hlo_utils.h",
    ],
    strip_include_prefix = ".",
    deps = [
        ":canonicalize_inc_gen",
        ":convert_op_folder",
        ":hlo_ops_attrs_inc_gen",
        ":hlo_ops_common",
        ":hlo_ops_enums_inc_gen",
        ":hlo_ops_inc_gen",
        ":hlo_ops_pattern_inc_gen",
        ":hlo_ops_typedefs_inc_gen",
        "//stablehlo:base",
        "//stablehlo:broadcast_utils",
        "//stablehlo:chlo_ops",
        "//stablehlo:stablehlo_assembly_format",
        "//stablehlo:stablehlo_type_inference",
        "@llvm-project//llvm:Support",
        "@llvm-project//mlir:Analysis",
        "@llvm-project//mlir:ArithDialect",
        "@llvm-project//mlir:BytecodeOpInterface",
        "@llvm-project//mlir:ComplexDialect",
        "@llvm-project//mlir:ControlFlowInterfaces",
        "@llvm-project//mlir:Dialect",
        "@llvm-project//mlir:FuncDialect",
        "@llvm-project//mlir:FunctionInterfaces",
        "@llvm-project//mlir:IR",
        "@llvm-project//mlir:InferTypeOpInterface",
        "@llvm-project//mlir:InliningUtils",
        "@llvm-project//mlir:LLVMDialect",
        "@llvm-project//mlir:MemRefDialect",
        "@llvm-project//mlir:Pass",
        "@llvm-project//mlir:QuantOps",
        "@llvm-project//mlir:ShapeDialect",
        "@llvm-project//mlir:SideEffectInterfaces",
        "@llvm-project//mlir:SparseTensorDialect",
        "@llvm-project//mlir:Support",
        "@llvm-project//mlir:TensorDialect",
        "@llvm-project//mlir:TransformUtils",
        "@llvm-project//mlir:Transforms",
    ],
)

cc_library(
    name = "lhlo",
    srcs = ["lhlo/IR/lhlo_ops.cc"],
    hdrs = [
        "lhlo/IR/lhlo_ops.h",
        "lhlo/IR/lhlo_ops_structs.h",
        "lhlo/utils/lhlo_utils.h",
    ],
    strip_include_prefix = ".",
    deps = [
        ":hlo_ops_common",
        ":lhlo_ops_inc_gen",
        ":lhlo_ops_structs_inc_gen",
        ":lhlo_structured_interface",
        ":mlir_hlo",
        "//stablehlo:stablehlo_type_inference",
        "@llvm-project//llvm:Support",
        "@llvm-project//mlir:BufferizationDialect",
        "@llvm-project//mlir:ControlFlowInterfaces",
        "@llvm-project//mlir:CopyOpInterface",
        "@llvm-project//mlir:FuncDialect",
        "@llvm-project//mlir:IR",
        "@llvm-project//mlir:LoopLikeInterface",
        "@llvm-project//mlir:MemRefDialect",
        "@llvm-project//mlir:SideEffectInterfaces",
        "@llvm-project//mlir:Support",
        "@llvm-project//mlir:ViewLikeInterface",
    ],
)

cc_library(
    name = "hlo_dialect_registration",
    srcs = ["mhlo/IR/init.cc"],
    hdrs = ["mhlo/IR/register.h"],
    strip_include_prefix = ".",
    deps = [
        ":mlir_hlo",
        "@llvm-project//mlir:IR",
        "@llvm-project//mlir:SparseTensorDialect",
        # Backward compatibility with the old way of registering CHLO dialect
        "//stablehlo:chlo_ops",
    ],
)

cc_library(
    name = "mhlo_passes",
    srcs = [
        "mhlo/transforms/broadcast_propagation/broadcast_propagation.cc",
        "mhlo/transforms/chlo_legalize_to_hlo/chlo_legalize_to_hlo_pass.cc",
        "mhlo/transforms/collapse_elementwise_map/collapse_elementwise_map.cc",
        "mhlo/transforms/constraint_fusion/constraint_fusion_pass.cc",
        "mhlo/transforms/convert_to_signless/convert_to_signless_pass.cc",
        "mhlo/transforms/expand_hlo_tuples/expand_hlo_tuples.cc",
        "mhlo/transforms/expand_ops_simplifier/expand_ops_simplifier.cc",
        "mhlo/transforms/group_reduction_dimensions/group_reduction_dimensions.cc",
        "mhlo/transforms/hlo_legalize_shape_ops_to_standard/hlo_legalize_shape_ops_to_standard.cc",
        "mhlo/transforms/hlo_legalize_to_arithmetic/hlo_legalize_to_arithmetic.cc",
        "mhlo/transforms/hlo_legalize_to_memref/hlo_legalize_to_memref.cc",
        "mhlo/transforms/hlo_legalize_to_stablehlo/hlo_legalize_to_stablehlo_pass.cc",
        "mhlo/transforms/legalize_broadcast_to_broadcast_in_dim/legalize_broadcast_to_broadcast_in_dim.cc",
        "mhlo/transforms/legalize_control_flow/legalize_control_flow.cc",
        "mhlo/transforms/legalize_create_token_to_after_all/legalize_create_token_to_after_all.cc",
        "mhlo/transforms/legalize_cross_replica_sum_to_all_reduce/legalize_cross_replica_sum_to_all_reduce.cc",
        "mhlo/transforms/legalize_dot_general_to_dot/legalize_dot_general_to_dot.cc",
        "mhlo/transforms/legalize_dot_to_dot_general/legalize_dot_to_dot_general.cc",
        "mhlo/transforms/legalize_einsum_to_dot_general/legalize_einsum_to_dot_general.cc",
        "mhlo/transforms/legalize_gather_to_torch_index_select/legalize_gather_to_torch_index_select.cc",
        "mhlo/transforms/legalize_shape_computations/legalize_shape_computations.cc",
        "mhlo/transforms/legalize_sort/legalize_sort.cc",
        "mhlo/transforms/legalize_to_linalg/legalize_to_linalg.cc",
        "mhlo/transforms/legalize_to_standard/generated_legalize_to_standard.inc",
        "mhlo/transforms/legalize_to_standard/legalize_to_standard.cc",
        "mhlo/transforms/legalize_torch_index_select_to_gather/legalize_torch_index_select_to_gather.cc",
        "mhlo/transforms/legalize_trigonometric_to_approximation/legalize_trigonometric_to_approximation.cc",
        "mhlo/transforms/lower_complex/generated_lower_complex.inc",
        "mhlo/transforms/lower_complex/lower_complex.cc",
        "mhlo/transforms/lower_general_dot/lower_general_dot.cc",
        "mhlo/transforms/materialize_broadcasts/materialize_broadcasts.cc",
        "mhlo/transforms/materialize_broadcasts/materialize_broadcasts_pass.cc",
        "mhlo/transforms/merge_assuming_ops/merge_assuming_ops.cc",
        "mhlo/transforms/mhlo_canonicalize_dot/mhlo_canonicalize_dot.cc",
        "mhlo/transforms/mhlo_canonicalize_gather/mhlo_canonicalize_gather.cc",
        "mhlo/transforms/mhlo_canonicalize_reduction/mhlo_canonicalize_reduction.cc",
        "mhlo/transforms/mhlo_canonicalize_scatter/mhlo_canonicalize_scatter.cc",
        "mhlo/transforms/mhlo_flatten_tuple/mhlo_flatten_tuple.cc",
        "mhlo/transforms/mhlo_passes.h.inc",
        "mhlo/transforms/mhlo_quant_legalize_to_int/mhlo_quant_legalize_to_int.cc",
        "mhlo/transforms/optimize_mhlo/optimize_mhlo.cc",
        "mhlo/transforms/optimize_mhlo/optimize_mhlo_pass.cc",
        "mhlo/transforms/prepare_for_export/prepare_for_export.cc",
        "mhlo/transforms/restrict_max_rank/restrict_max_rank.cc",
        "mhlo/transforms/shape_legalize_to_hlo/shape_legalize_to_hlo.cc",
        "mhlo/transforms/shape_reification/shape_reification_pass.cc",
        "mhlo/transforms/shape_simplification/shape_simplification.cc",
        "mhlo/transforms/sink_constants_to_control_flow/sink_constants_to_control_flow.cc",
        "mhlo/transforms/stablehlo_legalize_to_hlo/stablehlo_legalize_to_hlo_pass.cc",
        "mhlo/transforms/symbolic_shape_optimization/symbolic_shape_optimization.cc",
        "mhlo/transforms/test_infer_shaped_type/test_infer_shaped_type_pass.cc",
        "mhlo/transforms/unfuse_batch_norm/unfuse_batch_norm_pass.cc",
    ],
    hdrs = [
        "mhlo/interfaces/bufferizable_op_interface_impl.h",
        "mhlo/transforms/passes.h",
        "mhlo/transforms/rewriters.h",
        "mhlo/utils/legalize_to_linalg_utils.h",
        "mhlo/utils/mhlo_rng_utils.h",
    ],
    strip_include_prefix = ".",
    deps = [
        ":chlo_legalize_to_hlo_inc_gen",
        ":hlo_legalize_to_stablehlo",
        ":legalize_to_linalg_utils",
        ":legalize_to_standard_inc_gen",
        ":lhlo",
        ":lower_complex_inc_gen",
        ":map_chlo_to_hlo_op",
        ":map_hlo_to_lhlo_op",
        ":map_mhlo_to_scalar_op",
        ":mhlo_pass_inc_gen",
        ":mhlo_rng_utils",
        ":mhlo_scatter_gather_utils",
        ":mlir_hlo",
        ":shape_component_analysis",
        ":stablehlo_legalize_to_hlo",
        ":type_conversion",
        ":unfuse_batch_norm",
        "//stablehlo:base",
        "//stablehlo:chlo_ops",
        "//stablehlo:stablehlo_ops",
        "//stablehlo:stablehlo_passes",
        "@llvm-project//llvm:Support",
        "@llvm-project//mlir:AffineDialect",
        "@llvm-project//mlir:ArithDialect",
        "@llvm-project//mlir:ArithUtils",
        "@llvm-project//mlir:BufferizationDialect",
        "@llvm-project//mlir:BufferizationInterfaces",
        "@llvm-project//mlir:BufferizationTransforms",
        "@llvm-project//mlir:ComplexDialect",
        "@llvm-project//mlir:ControlFlowDialect",
        "@llvm-project//mlir:DialectUtils",
        "@llvm-project//mlir:FuncDialect",
        "@llvm-project//mlir:FuncTransforms",
        "@llvm-project//mlir:IR",
        "@llvm-project//mlir:InferTypeOpInterface",
        "@llvm-project//mlir:LinalgDialect",
        "@llvm-project//mlir:LinalgTransforms",
        "@llvm-project//mlir:LinalgUtils",
        "@llvm-project//mlir:MathDialect",
        "@llvm-project//mlir:MemRefDialect",
        "@llvm-project//mlir:Pass",
        "@llvm-project//mlir:QuantOps",
        "@llvm-project//mlir:SCFDialect",
        "@llvm-project//mlir:ShapeDialect",
        "@llvm-project//mlir:ShapeTransforms",
        "@llvm-project//mlir:SideEffectInterfaces",
        "@llvm-project//mlir:SparseTensorDialect",
        "@llvm-project//mlir:Support",
        "@llvm-project//mlir:TensorDialect",
        "@llvm-project//mlir:TensorUtils",
        "@llvm-project//mlir:TransformUtils",
        "@llvm-project//mlir:Transforms",
    ],
)

cc_library(
    name = "type_conversion",
    srcs = ["mhlo/utils/type_conversion.cc"],
    hdrs = ["mhlo/utils/type_conversion.h"],
    strip_include_prefix = ".",
    deps = [
        ":mlir_hlo",
        "//stablehlo:stablehlo_ops",
        "@llvm-project//mlir:FuncDialect",
        "@llvm-project//mlir:FuncTransforms",
        "@llvm-project//mlir:IR",
        "@llvm-project//mlir:Support",
        "@llvm-project//mlir:TensorDialect",
        "@llvm-project//mlir:TransformUtils",
        "@llvm-project//mlir:Transforms",
    ],
)

cc_library(
    name = "map_lmhlo_to_scalar_op",
    hdrs = ["lhlo/transforms/map_lmhlo_to_scalar_op.h"],
    strip_include_prefix = ".",
    deps = [
        ":map_lhlo_to_hlo_op",
        ":map_mhlo_to_scalar_op",
    ],
)

cc_library(
    name = "map_mhlo_to_scalar_op",
    hdrs = ["mhlo/transforms/map_mhlo_to_scalar_op.h"],
    strip_include_prefix = ".",
    deps = [
        ":mlir_hlo",
        "@llvm-project//llvm:Support",
        "@llvm-project//mlir:ArithDialect",
        "@llvm-project//mlir:ComplexDialect",
        "@llvm-project//mlir:IR",
        "@llvm-project//mlir:MathDialect",
        "@llvm-project//mlir:SCFDialect",
        "@llvm-project//mlir:Support",
    ],
)

cc_library(
    name = "map_chlo_to_hlo_op",
    hdrs = ["mhlo/transforms/map_chlo_to_hlo_op.h"],
    strip_include_prefix = ".",
    deps = [
        ":mlir_hlo",
        "//stablehlo:chlo_ops",
        "@llvm-project//mlir:IR",
    ],
)

cc_library(
    name = "map_hlo_to_lhlo_op",
    hdrs = ["lhlo/transforms/map_hlo_to_lhlo_op.h"],
    strip_include_prefix = ".",
    deps = [
        ":lhlo",
        ":mlir_hlo",
    ],
)

cc_library(
    name = "map_lhlo_to_hlo_op",
    hdrs = ["lhlo/transforms/map_lhlo_to_hlo_op.h"],
    strip_include_prefix = ".",
    deps = [
        ":lhlo",
        ":mlir_hlo",
    ],
)

cc_library(
    name = "map_stablehlo_to_hlo_op",
    hdrs = ["mhlo/transforms/map_stablehlo_to_hlo_op.h"],
    strip_include_prefix = ".",
    deps = [
        ":mlir_hlo",
        "//stablehlo:stablehlo_ops",
    ],
)

cc_library(
    name = "lmhlo_passes",
    srcs = [
        "lhlo/transforms/legalize_to_tensor_op/legalize_to_tensor_op.cc",
        "lhlo/transforms/lhlo_legalize_to_affine/lhlo_legalize_to_affine.cc",
        "lhlo/transforms/lhlo_legalize_to_gpu/lhlo_legalize_to_gpu.cc",
        "lhlo/transforms/lhlo_legalize_to_parallel_loops/lhlo_legalize_to_parallel_loops.cc",
        "lhlo/transforms/lmhlo_passes.h.inc",
    ],
    hdrs = ["lhlo/transforms/passes.h"],
    strip_include_prefix = ".",
    deps = [
        ":lhlo",
        ":lmhlo_pass_inc_gen",
        ":map_lmhlo_to_scalar_op",
        ":mlir_hlo",
        "@llvm-project//llvm:Support",
        "@llvm-project//mlir:AffineDialect",
        "@llvm-project//mlir:ArithDialect",
        "@llvm-project//mlir:BufferizationDialect",
        "@llvm-project//mlir:FuncDialect",
        "@llvm-project//mlir:GPUDialect",
        "@llvm-project//mlir:IR",
        "@llvm-project//mlir:LinalgDialect",
        "@llvm-project//mlir:LinalgTransforms",
        "@llvm-project//mlir:MemRefDialect",
        "@llvm-project//mlir:Pass",
        "@llvm-project//mlir:SCFDialect",
        "@llvm-project//mlir:ShapeDialect",
        "@llvm-project//mlir:Support",
        "@llvm-project//mlir:TensorDialect",
        "@llvm-project//mlir:TransformUtils",
        "@llvm-project//mlir:Transforms",
        "@llvm-project//mlir:ViewLikeInterface",
    ],
)

cc_library(
    name = "codegen_utils",
    srcs = ["utils/codegen_utils.cc"],
    hdrs = ["utils/codegen_utils.h"],
    strip_include_prefix = ".",
    deps = [
        "@llvm-project//llvm:Support",
        "@llvm-project//mlir:ArithDialect",
        "@llvm-project//mlir:FuncDialect",
        "@llvm-project//mlir:IR",
        "@llvm-project//mlir:LLVMDialect",
        "@llvm-project//mlir:MemRefDialect",
        "@llvm-project//mlir:Pass",
        "@llvm-project//mlir:Support",
    ],
)

cc_library(
    name = "placement_utils",
    hdrs = ["utils/placement_utils.h"],
    strip_include_prefix = ".",
    deps = ["@llvm-project//llvm:Support"],
)

cc_library(
    name = "legalize_to_linalg_utils",
    srcs = ["mhlo/utils/legalize_to_linalg_utils.cc"],
    hdrs = ["mhlo/utils/legalize_to_linalg_utils.h"],
    strip_include_prefix = ".",
    deps = [
        ":map_mhlo_to_scalar_op",
        ":mlir_hlo",
        "//stablehlo:chlo_ops",
        "@llvm-project//llvm:Support",
        "@llvm-project//mlir:AffineDialect",
        "@llvm-project//mlir:BufferizationDialect",
        "@llvm-project//mlir:ComplexDialect",
        "@llvm-project//mlir:FuncDialect",
        "@llvm-project//mlir:IR",
        "@llvm-project//mlir:LinalgDialect",
        "@llvm-project//mlir:LinalgUtils",
        "@llvm-project//mlir:MathDialect",
        "@llvm-project//mlir:ShapeDialect",
        "@llvm-project//mlir:SparseTensorDialect",
        "@llvm-project//mlir:Support",
        "@llvm-project//mlir:TensorDialect",
        "@llvm-project//mlir:TensorUtils",
        "@llvm-project//mlir:TransformUtils",
        "@llvm-project//mlir:Transforms",
    ],
)

cc_library(
    name = "mhlo_rng_utils",
    srcs = ["mhlo/utils/mhlo_rng_utils.cc"],
    hdrs = ["mhlo/utils/mhlo_rng_utils.h"],
    strip_include_prefix = ".",
    deps = [
        ":mlir_hlo",
        "@llvm-project//llvm:Support",
        "@llvm-project//mlir:ArithDialect",
        "@llvm-project//mlir:DialectUtils",
        "@llvm-project//mlir:IR",
        "@llvm-project//mlir:LinalgDialect",
        "@llvm-project//mlir:MathDialect",
        "@llvm-project//mlir:Support",
        "@llvm-project//mlir:TensorDialect",
        "@llvm-project//mlir:Transforms",
    ],
)

cc_library(
    name = "mhlo_scatter_gather_utils",
    srcs = ["mhlo/utils/mhlo_scatter_gather_utils.cc"],
    hdrs = ["mhlo/utils/mhlo_scatter_gather_utils.h"],
    strip_include_prefix = ".",
    deps = [
        ":mlir_hlo",
        "@llvm-project//mlir:DialectUtils",
        "@llvm-project//mlir:Support",
        "@llvm-project//mlir:TensorDialect",
    ],
)

gentbl_cc_library(
    name = "legalize_to_standard_inc_gen",
    strip_include_prefix = "mhlo/transforms/",
    tbl_outs = [
        (
            ["-gen-rewriters"],
            "mhlo/transforms/legalize_to_standard/generated_legalize_to_standard.inc",
        ),
    ],
    tblgen = "@llvm-project//mlir:mlir-tblgen",
    td_file = "mhlo/transforms/legalize_to_standard/legalize_to_standard_patterns.td",
    deps = [
        ":hlo_ops_td_files",
        "@llvm-project//mlir:ArithOpsTdFiles",
        "@llvm-project//mlir:FuncTdFiles",
        "@llvm-project//mlir:MathOpsTdFiles",
    ],
)

gentbl_cc_library(
    name = "lower_complex_inc_gen",
    strip_include_prefix = "mhlo/transforms/",
    tbl_outs = [
        (
            ["-gen-rewriters"],
            "mhlo/transforms/lower_complex/generated_lower_complex.inc",
        ),
    ],
    tblgen = "@llvm-project//mlir:mlir-tblgen",
    td_file = "mhlo/transforms/lower_complex/lower_complex_patterns.td",
    deps = [
        ":hlo_ops_td_files",
        "@llvm-project//mlir:FuncTdFiles",
    ],
)

cc_library(
    name = "unfuse_batch_norm",
    srcs = ["mhlo/transforms/unfuse_batch_norm/unfuse_batch_norm.cc"],
    hdrs = ["mhlo/transforms/rewriters.h"],
    strip_include_prefix = ".",
    deps = [
        ":mlir_hlo",
        "@llvm-project//llvm:Support",
        "@llvm-project//mlir:ArithDialect",
        "@llvm-project//mlir:FuncDialect",
        "@llvm-project//mlir:IR",
        "@llvm-project//mlir:ShapeDialect",
        "@llvm-project//mlir:Support",
        "@llvm-project//mlir:TensorDialect",
        "@llvm-project//mlir:TransformUtils",
        "@llvm-project//mlir:Transforms",
    ],
)

gentbl_cc_library(
    name = "chlo_legalize_to_hlo_inc_gen",
    strip_include_prefix = "mhlo/transforms",
    tbl_outs = [
        (
            ["-gen-rewriters"],
            "mhlo/transforms/chlo_legalize_to_hlo/generated_chlo_legalize_to_hlo.inc",
        ),
    ],
    tblgen = "@llvm-project//mlir:mlir-tblgen",
    td_file = "mhlo/transforms/chlo_legalize_to_hlo/chlo_legalize_to_hlo_patterns.td",
    deps = [":hlo_ops_td_files"],
)

cc_library(
    name = "hlo_legalize_to_stablehlo",
    srcs = ["mhlo/transforms/hlo_legalize_to_stablehlo/hlo_legalize_to_stablehlo.cc"],
    hdrs = ["mhlo/transforms/rewriters.h"],
    strip_include_prefix = ".",
    deps = [
        ":map_stablehlo_to_hlo_op",
        ":mlir_hlo",
        "//stablehlo:stablehlo_ops",
        "//stablehlo:stablehlo_ops_inc_gen",
        "@llvm-project//llvm:Support",
        "@llvm-project//mlir:FuncDialect",
        "@llvm-project//mlir:IR",
        "@llvm-project//mlir:Support",
        "@llvm-project//mlir:TransformUtils",
        "@llvm-project//mlir:Transforms",
    ],
)

cc_library(
    name = "stablehlo_legalize_to_hlo",
    srcs = ["mhlo/transforms/stablehlo_legalize_to_hlo/stablehlo_legalize_to_hlo.cc"],
    hdrs = ["mhlo/transforms/rewriters.h"],
    strip_include_prefix = ".",
    deps = [
        ":map_stablehlo_to_hlo_op",
        ":mlir_hlo",
        "//stablehlo:stablehlo_ops",
        "//stablehlo:stablehlo_ops_inc_gen",
        "@llvm-project//llvm:Support",
        "@llvm-project//mlir:AsmParser",
        "@llvm-project//mlir:FuncDialect",
        "@llvm-project//mlir:IR",
        "@llvm-project//mlir:Support",
        "@llvm-project//mlir:TransformUtils",
        "@llvm-project//mlir:Transforms",
    ],
)

cc_library(
    name = "all_passes",
    srcs = [
        # These are not exposed as headers in the dependent targets, and
        # shouldn't be. Ideally, this entire target should be removed.
        "deallocation/transforms/passes.h.inc",
        "lhlo/transforms/lmhlo_passes.h.inc",
        "transforms/passes.h.inc",
    ],
    hdrs = [
        "deallocation/transforms/passes.h",
        "lhlo/transforms/passes.h",
        "mhlo/transforms/passes.h",
        "transforms/passes.h",
    ],
    strip_include_prefix = ".",
    deps = [
        ":deallocation_passes",
        ":deallocation_passes_inc_gen",
        ":lhlo",
        ":lmhlo_pass_inc_gen",
        ":lmhlo_passes",
        ":mhlo_pass_inc_gen",
        ":mhlo_passes",
        ":stablehlo_legalize_to_hlo",
        ":transforms_passes",
        ":transforms_passes_inc_gen",
        "@llvm-project//llvm:Support",
        "@llvm-project//mlir:FuncDialect",
        "@llvm-project//mlir:IR",
        "@llvm-project//mlir:LLVMCommonConversion",
        "@llvm-project//mlir:LLVMDialect",
        "@llvm-project//mlir:Pass",
    ],
)

cc_library(
    name = "transforms_passes",
    srcs = [
        "transforms/alloc_to_arg_pass.cc",
        "transforms/bufferize.cc",
        "transforms/bufferize_pass.cc",
        "transforms/collapse_parallel_loops_to_1d_pass.cc",
        "transforms/detensorize_scf_ops.cc",
        "transforms/generic_host_to_llvm.cc",
        "transforms/lower_index_cast_pass.cc",
        "transforms/naive_copy_removal.cc",
        "transforms/propagate_static_shapes_to_kernel.cc",
        "transforms/test_hlo_transform_dialect_interpreter.cc",
        "transforms/tile_loops_pass.cc",
        "transforms/unbufferize_pass.cc",
        "transforms/unroll_loops.cc",
        "transforms/vectorize_copy.cc",
    ],
    hdrs = [
        "transforms/passes.h",
        "transforms/passes.h.inc",
        "transforms/rewriters.h",
    ],
    strip_include_prefix = ".",
    deps = [
        ":deallocation_passes",
        ":lhlo",
        ":mhlo_passes",
        ":mlir_hlo",
        ":shape_component_analysis",
        ":transforms_passes_inc_gen",
        ":type_conversion",
        "//stablehlo:chlo_ops",
        "@llvm-project//llvm:Support",
        "@llvm-project//mlir:AffineDialect",
        "@llvm-project//mlir:AffineToStandard",
        "@llvm-project//mlir:Analysis",
        "@llvm-project//mlir:ArithDialect",
        "@llvm-project//mlir:ArithToLLVM",
        "@llvm-project//mlir:ArithTransforms",
        "@llvm-project//mlir:ArithUtils",
        "@llvm-project//mlir:AsmParser",
        "@llvm-project//mlir:BufferizationDialect",
        "@llvm-project//mlir:BufferizationInterfaces",
        "@llvm-project//mlir:BufferizationTransforms",
        "@llvm-project//mlir:ComplexDialect",
        "@llvm-project//mlir:ComplexToLLVM",
        "@llvm-project//mlir:ControlFlowDialect",
        "@llvm-project//mlir:ControlFlowToLLVM",
        "@llvm-project//mlir:CopyOpInterface",
        "@llvm-project//mlir:DialectUtils",
        "@llvm-project//mlir:FuncDialect",
        "@llvm-project//mlir:FuncToLLVM",
        "@llvm-project//mlir:FuncTransforms",
        "@llvm-project//mlir:GPUDialect",
        "@llvm-project//mlir:IR",
        "@llvm-project//mlir:LLVMCommonConversion",
        "@llvm-project//mlir:LLVMDialect",
        "@llvm-project//mlir:LinalgDialect",
        "@llvm-project//mlir:LinalgTransforms",
        "@llvm-project//mlir:LoopLikeInterface",
        "@llvm-project//mlir:MathDialect",
        "@llvm-project//mlir:MathToLLVM",
        "@llvm-project//mlir:MathToLibm",
        "@llvm-project//mlir:MathTransforms",
        "@llvm-project//mlir:MemRefDialect",
        "@llvm-project//mlir:MemRefToLLVM",
        "@llvm-project//mlir:MemRefTransforms",
        "@llvm-project//mlir:MemRefUtils",
        "@llvm-project//mlir:NVVMDialect",
        "@llvm-project//mlir:PDLDialect",
        "@llvm-project//mlir:Pass",
        "@llvm-project//mlir:ReconcileUnrealizedCasts",
        "@llvm-project//mlir:Rewrite",
        "@llvm-project//mlir:SCFDialect",
        "@llvm-project//mlir:SCFToControlFlow",
        "@llvm-project//mlir:SCFTransforms",
        "@llvm-project//mlir:SCFUtils",
        "@llvm-project//mlir:ShapeDialect",
        "@llvm-project//mlir:ShapeTransforms",
        "@llvm-project//mlir:Support",
        "@llvm-project//mlir:TensorDialect",
        "@llvm-project//mlir:TensorTransforms",
        "@llvm-project//mlir:TensorUtils",
        "@llvm-project//mlir:TransformDialect",
        "@llvm-project//mlir:TransformDialectInterfaces",
        "@llvm-project//mlir:TransformDialectTransforms",
        "@llvm-project//mlir:TransformUtils",
        "@llvm-project//mlir:Transforms",
        "@llvm-project//mlir:VectorDialect",
        "@llvm-project//mlir:VectorToLLVM",
        "@llvm-project//mlir:VectorTransforms",
        "@llvm-project//mlir:X86VectorDialect",
        "@llvm-project//mlir:X86VectorTransforms",
    ],
)

cc_library(
    name = "transforms_gpu_passes",
    srcs = [
        "transforms/gpu_kernel_lowering_passes.cc",
        "transforms/gpu_passes.cc",
        "transforms/gpu_passes.h.inc",
    ],
    hdrs = ["transforms/gpu_passes.h"],
    strip_include_prefix = ".",
    deps = [
        ":gpu_transforms_passes_inc_gen",
        ":lhlo",
        ":mhlo_passes",
        ":mlir_hlo",
        ":transforms_passes",
        "@llvm-project//llvm:Support",
        "@llvm-project//mlir:AffineDialect",
        "@llvm-project//mlir:AffineToStandard",
        "@llvm-project//mlir:ArithDialect",
        "@llvm-project//mlir:ArithToLLVM",
        "@llvm-project//mlir:ArithTransforms",
        "@llvm-project//mlir:BufferizationDialect",
        "@llvm-project//mlir:BufferizationTransforms",
        "@llvm-project//mlir:ComplexToLLVM",
        "@llvm-project//mlir:ControlFlowToLLVM",
        "@llvm-project//mlir:FuncDialect",
        "@llvm-project//mlir:FuncToLLVM",
        "@llvm-project//mlir:GPUCommonTransforms",
        "@llvm-project//mlir:GPUDialect",
        "@llvm-project//mlir:GPUToGPURuntimeTransforms",
        "@llvm-project//mlir:GPUToNVVMTransforms",
        "@llvm-project//mlir:GPUToROCDLTransforms",
        "@llvm-project//mlir:GPUTransforms",
        "@llvm-project//mlir:IR",
        "@llvm-project//mlir:LLVMCommonConversion",
        "@llvm-project//mlir:LLVMDialect",
        "@llvm-project//mlir:LinalgTransforms",
        "@llvm-project//mlir:MathToLLVM",
        "@llvm-project//mlir:MemRefDialect",
        "@llvm-project//mlir:MemRefToLLVM",
        "@llvm-project//mlir:MemRefTransforms",
        "@llvm-project//mlir:NVVMDialect",
        "@llvm-project//mlir:Pass",
        "@llvm-project//mlir:ROCDLDialect",
        "@llvm-project//mlir:Rewrite",
        "@llvm-project//mlir:SCFToControlFlow",
        "@llvm-project//mlir:SCFTransforms",
        "@llvm-project//mlir:ShapeToStandard",
        "@llvm-project//mlir:TensorInferTypeOpInterfaceImpl",
        "@llvm-project//mlir:TransformUtils",
        "@llvm-project//mlir:Transforms",
        "@llvm-project//mlir:VectorDialect",
        "@llvm-project//mlir:VectorToLLVM",
        "@llvm-project//mlir:VectorTransforms",
    ],
)

gentbl_cc_library(
    name = "transforms_passes_inc_gen",
    strip_include_prefix = ".",
    tbl_outs = [
        (
            [
                "-gen-pass-decls",
                "-name=LMHLOTransforms",
            ],
            "transforms/passes.h.inc",
        ),
    ],
    tblgen = "@llvm-project//mlir:mlir-tblgen",
    td_file = "transforms/passes.td",
    deps = ["@llvm-project//mlir:PassBaseTdFiles"],
)

gentbl_cc_library(
    name = "gpu_transforms_passes_inc_gen",
    strip_include_prefix = ".",
    tbl_outs = [
        (
            [
                "-gen-pass-decls",
                "-name=LMHLOGPUTransforms",
            ],
            "transforms/gpu_passes.h.inc",
        ),
    ],
    tblgen = "@llvm-project//mlir:mlir-tblgen",
    td_file = "transforms/gpu_passes.td",
    deps = ["@llvm-project//mlir:PassBaseTdFiles"],
)

cc_library(
    name = "shape_component_analysis",
    srcs = ["mhlo/analysis/shape_component_analysis.cc"],
    hdrs = ["mhlo/analysis/shape_component_analysis.h"],
    strip_include_prefix = ".",
    deps = [
        ":mlir_hlo",
        "@llvm-project//llvm:Support",
        "@llvm-project//mlir:ArithDialect",
        "@llvm-project//mlir:FuncDialect",
        "@llvm-project//mlir:IR",
        "@llvm-project//mlir:ShapeDialect",
        "@llvm-project//mlir:Support",
        "@llvm-project//mlir:TensorDialect",
    ],
)

CAPI_HEADERS = [
    "bindings/c/Attributes.h",
    "bindings/c/Dialects.h",
    "bindings/c/Passes.h",
    "bindings/c/Types.h",
]

CAPI_SOURCES = [
    "bindings/c/Attributes.cc",
    "bindings/c/Dialects.cc",
    "bindings/c/Passes.cc",
    "bindings/c/Types.cc",
]

cc_library(
    name = "CAPI",
    srcs = CAPI_SOURCES,
    hdrs = CAPI_HEADERS,
    strip_include_prefix = ".",
    deps = [
        ":all_passes",
        ":mlir_hlo",
        "@llvm-project//mlir:CAPIIR",
        "@llvm-project//mlir:Support",
    ],
)

# Header-only target, used when using the C API from a separate shared library.
cc_library(
    name = "CAPIHeaders",
    hdrs = CAPI_HEADERS,
    strip_include_prefix = ".",
    deps = ["@llvm-project//mlir:CAPIIRHeaders"],
)

# Alwayslink target, used when exporting the C API from a shared library.
cc_library(
    name = "CAPIObjects",
    srcs = CAPI_SOURCES,
    hdrs = CAPI_HEADERS,
    strip_include_prefix = ".",
    deps = [
        ":all_passes",
        ":mlir_hlo",
        "@llvm-project//mlir:CAPIIRObjects",
        "@llvm-project//mlir:Support",
    ],
    alwayslink = True,
)

build_test(
    name = "mlir-hlo-opt_build_test",
    targets = [
        ":mlir-hlo-opt",
    ],
)

cc_binary(
    name = "mlir-hlo-opt",
    srcs = ["tools/mlir-hlo-opt/mlir-hlo-opt.cc"],
    deps = [
        ":all_passes",
        ":hlo_dialect_registration",
        ":lhlo",
        ":transforms_gpu_passes",
        "//stablehlo:register",
        "@llvm-project//llvm:Support",
        "@llvm-project//mlir:AllExtensions",
        "@llvm-project//mlir:AllPassesAndDialects",
        "@llvm-project//mlir:IR",
        "@llvm-project//mlir:MlirOptLib",
        "@llvm-project//mlir:Pass",
        "@llvm-project//mlir:Support",
    ],
)

# Python library.

gentbl_filegroup(
    name = "MhloOpsPyGen",
    tbl_outs = [
        (
            [
                "-gen-python-op-bindings",
                "-bind-dialect=mhlo",
            ],
            "bindings/python/mlir/dialects/_mhlo_ops_gen.py",
        ),
    ],
    tblgen = "@llvm-project//mlir:mlir-tblgen",
    td_file = "bindings/python/mlir/dialects/MhloOps.td",
    deps = [
        ":hlo_ops_td_files",
        "@llvm-project//mlir:OpBaseTdFiles",
    ],
)

filegroup(
    name = "MhloOpsPyFiles",
    srcs = [
        "bindings/python/mlir/dialects/mhlo.py",
        ":MhloOpsPyGen",
    ],
)

# A light-weight runtime support library, used by MLIR code that results
# after lowering some ops in the vector and sparse tensor dialects.
cc_binary(
    name = "libmlir_c_runner_utils.so",
    linkshared = True,
    linkstatic = False,
    deps = ["@llvm-project//mlir:mlir_c_runner_utils"],
)
