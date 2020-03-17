package edu.rosehulman.liuz6;

import org.apache.pig.EvalFunc;
import org.apache.pig.FilterFunc;
import org.apache.pig.FuncSpec;
import org.apache.pig.data.DataType;
import org.apache.pig.data.Tuple;
import org.apache.pig.impl.logicalLayer.FrontendException;
import org.apache.pig.impl.logicalLayer.schema.Schema;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class Concatenate extends EvalFunc<String> {

	public String exec(Tuple input) throws IOException {
		if (input == null || input.size() < 2) {
			return null;
		}

		return input.get(0).toString() + " " + input.get(1).toString();
	}
}
