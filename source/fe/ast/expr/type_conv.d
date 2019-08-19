/// Copyright: Copyright (c) 2017-2019 Andrey Penechko.
/// License: $(WEB boost.org/LICENSE_1_0.txt, Boost License 1.0).
/// Authors: Andrey Penechko.
module fe.ast.expr.type_conv;

import all;


struct TypeConvExprNode {
	mixin ExpressionNodeData!(AstType.expr_type_conv);
	AstIndex expr;
}

void name_resolve_type_conv(TypeConvExprNode* node, ref NameResolveState state) {
	node.state = AstNodeState.name_resolve;
	require_name_resolve(node.type, state);
	require_name_resolve(node.expr, state);
	node.state = AstNodeState.name_resolve_done;
}