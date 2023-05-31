module "vpc" {
    source = "./modules/vpc"
    environment          = "${var.root_environment}"
    vpc_cidr             = "${var.root_vpc_cidr}"
    public_subnets_cidr  = "${var.root_public_subnets_cidr}"
    private_subnets_cidr = "${var.root_private_subnets_cidr}"
    availability_zones   = tolist([data.aws_availability_zones.available.names[0], data.aws_availability_zones.available.names[1], data.aws_availability_zones.available.names[2]])
}

module "eks-cluster" {
    source = "./modules/eks-cluster"
    environment = "${var.root_environment}"
    vpc_id = module.vpc.vpc_id
    eks_subnet_ids = module.vpc.private_subnet_ids
}

