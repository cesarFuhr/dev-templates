{
  description = "My collection of develepment environment templates";

  outputs = { self }: {
    templates = {
      go_1_20 = {
        path = ./go/go_1_20;
        description = "a basic go 1.20 environment";
      };
      go_1_16 = {
        path = ./go/go_1_16;
        description = "a basic go 1.16 environment";
      };
      rust = {
        path = ./rust;
        description = "a basic rust environment";
      };
    };
  };
}
