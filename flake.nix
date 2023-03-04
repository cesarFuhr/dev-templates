{
  description = "My collection of develepment environment templates";

  outputs = { self }: {
    templates = {
      go = {
        path = ./go;
        description = "a basic go environment";
      };
    };
  };
}
