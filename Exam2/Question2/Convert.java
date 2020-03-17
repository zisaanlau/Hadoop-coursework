package edu.rosehulman.liuz6;

import org.apache.pig.EvalFunc;
import org.apache.pig.FuncSpec;
import org.apache.pig.data.DataType;
import org.apache.pig.data.Tuple;
import org.apache.pig.impl.logicalLayer.FrontendException;
import org.apache.pig.impl.logicalLayer.schema.Schema;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class Convert extends EvalFunc<String> {
	public List<FuncSpec> getArgToFuncMapping() throws FrontendException {

		List<FuncSpec> funcSpecs = new ArrayList<FuncSpec>();

		funcSpecs.add(
				new FuncSpec(this.getClass().getName(), new Schema(new Schema.FieldSchema(null, DataType.DOUBLE))));
		return funcSpecs;
	}

	public String exec(Tuple input) throws IOException {
		if ((input == null) || (input.size() == 0)) {
			return null;
		}
		Object val = input.get(0);

		double i = ((Double) val).doubleValue();
		if (i == 90) {
			return "A";
		}
		if (i < 90 && i > 80) {
			return "B";
		}
		if (i <= 80 && i > 70) {
			return "C";
		}
		if (i <= 70 && i > 60) {
			return "D";
		}
		if (i <= 60) {
			return "F";
		}
		return null;
	}

}
