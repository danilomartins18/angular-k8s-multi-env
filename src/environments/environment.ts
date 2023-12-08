const globalEnv = (<any>window).__env;
export const environment = {
  name: String(globalEnv.name)
};
