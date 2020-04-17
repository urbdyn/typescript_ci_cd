import { checkName } from "../src/index";

test("sally should be false", () => expect(checkName("sally")).toBe(false));
test("something should be true", () => expect(checkName("something")).toBe(true));

